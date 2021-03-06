function read_gms_file(filename::AbstractString)

    println("Reading $(filename) ...")

    filepath = joinpath(Pkg.dir("toJuMP"),".gms","")
    filepath = string(filepath,filename,".gms")

    if isfile(filepath)
        f = open(filepath, "r")
    elseif isfile(filename)
        f = open(filename, "r")
    else
        error("No gms file detected.")
    end

    #=
        ----------------------- Line Header Space ------------------
            Example :: 4stufen.gms
        Unkown ::
        $offlisting
        $if set nostart $goto modeldef
        $label modeldef
        $if not set MINLP $set MINLP MINLP  Model Type

        *                 -> comment
        Null              -> emptyline
        Variables         -> All Variable List, separated by ","
        Positive Variable -> Non-negative variables list, separated by "," (assert)
        Binary Variable   -> Binary variables list, separated by "," (assert)
        Equations         -> Equations symbols, separated by ","
        EquSymbols..      -> Equation content
        VarSymbols.lo     -> Lower Bound
        VarSymbols.l      -> Upper Bound ??
        Model m / all /   -> ??
        m.limrow=0
        m.
        ------------------------------------------------------------
    =#

    # Null Trackers
    skip = 0
    comment = 0

    # Main data structure initialization
    gms = oneProblem()

    # -------------------------- Start Reading -------------------------- #
    for l in eachline(f)
        sl = lstrip(l, ' ')
        if isempty(sl) || length(sl) == 1  # Skip empty line
            skip += 1
        elseif sl[1] == "*"
            comment += 1
        else
            slt = split(sl, r" |,|\.")
            slt = [slt[i] for i in 1:length(slt) if length(slt[i]) > 0]
            if slt[1] in GMS_BLOCK_HEADER
                read_block(f, gms, l)           # Reading a general block
            elseif slt[1] in gms.rows #ismatch(r"e\d", sl[1])
                read_equation(f, gms, l)        # Reading an equation block
            elseif slt[1] in gms.cols #ismatch(r"\w\.\w", sl[1])
                read_bounds(f, gms, l)          # Reading a bound block
            elseif slt[1] == "\$"
                read_command(f, gms, l)         # Reading a logical command line
            elseif slt[1] == "Model"
                read_model(f, gms, sl)           # Reading a model command
            elseif slt[1] == "Solve"
                read_solve(f, gms, sl)           # Reading a solve command line
            else
                # println("[Unkown]DUMPING >> ", l)
            end
        end

    end
    close(f)
    return gms
end

function read_block(file::IOStream, gms::oneProblem, lInit::AbstractString; kwargs...)

    sl = split(get_one_line(file, one_line=lInit), r" |,")
    sl = [sl[i] for i in 1:length(sl) if !isempty(sl[i])]  # Eliminate empty entries

    blockIdentifier = sl[1]  # This should always be true

    for i in 1:length(sl)
        if blockIdentifier == "Variables" && (i > 1)
            push!(gms.cols, sl[i])
        elseif blockIdentifier == "Positive" && (i > 2)
            gms.colsType[sl[i]] = "Positive"
        elseif blockIdentifier == "Negative" && (i > 2)
            gms.colsType[sl[i]] = "Negative"
        elseif blockIdentifier == "Binary" && (i > 2)
            gms.colsType[sl[i]] = "Binary"
        elseif blockIdentifier == "Semicont"
            error("Currently don't support semi continous variables parsing.")
        elseif blockIdentifier == "Integer" && (i > 2)
            gms.colsType[sl[i]] = "Integer"
        elseif blockIdentifier == "Equations" && (i > 1)
            push!(gms.rows, sl[i])
        end
    end

    return
end

function read_equation(file::IOStream, gms::oneProblem, lInit::AbstractString; kwargs...)

    #=
        Example Equation
        #Single Line
        e1..    objvar - x145 - x146 - x147 - x148 - x149 - x150 =E= 3271.22725820856;
        # Multi Line
        e38..    109.0495*x1 + 100.462*x2 + 115.2937*x3 + 2.860271*x4 + 15.1404*x5
               + x44 - x556 =E= 101.1304;
    =#

    lhs = ""
    rhs = ""
    sense = ""
	eN = string(strip(split(lInit, r" |,")[1], ['.', '\r', '\n']))
    eS = split(eN, '.')
    if eN in gms.rows
        one_l = get_one_line(file, one_line=lInit)
        one_l = replace(one_l, "$(eN)..", "")
        if contains(one_l, "=E=")
            gms.rowsSense[eN] = "E"
        elseif contains(one_l, "=L=")
            gms.rowsSense[eN] = "L"
        elseif contains(one_l, "=G=")
            gms.rowsSense[eN] = "G"
		elseif contains(one_l, "=N=")
			gms.rowsSense[eN] = "N"
        else
            error("NO sense detected in equation. $(one_l)")
        end
        sl = split(one_l, "=$(gms.rowsSense[eN])=", keep=false)
        gms.rowsLHS[eN] = replace(sl[1], " ", "")
        gms.rowsRHS[eN] = Float64(parse(sl[2]))
    elseif length(eS) == 2 && eS[2] == "m"
        @assert eS[1] in gms.rows
        one_l = get_one_line(file, one_line=lInit)
        mVal = parse(split(one_l, "=", keep=false)[2])
        gms.m[eS[1]] = mVal
    else
        error("Non-indexed constraint detected. \n$(lInit)")
    end

    return
end

function read_bounds(file::IOStream, gms::oneProblem, lInit::AbstractString; kwargs...)

    #=
        .lo lower bound
        .l level or primal value
        .up upper bound
        .m marginal or dual value
    =#
	@assert rstrip(strip(lInit, ['\n','\r']), ' ')[end] == ';' # Assumption :: alwasy one line
    all_segs = split(lInit, ';', keep=false)
    all_segs = [i for i in all_segs if !isempty(strip(i,' '))]
    for lseg in all_segs
        lseg = strip(lseg, [';', '\n', ' ', '\r'])
        sl = split(lseg, "=")
        sl = [sl[i] for i in 1:length(sl) if !isempty(sl[i])]
        # There shouldn't be any space to begin with
        sl[1] = strip(sl[1], [';', '\n', ' ', '\r'])
		sl[2] = strip(sl[2], [';', '\n', ' ', '\r'])
        @assert ismatch(r"\w.\w", sl[1])
        boundVal = Float64(parse(sl[end]))
        var = split(sl[1],".")[1]
        attr = split(sl[1],".")[2]

        if attr == "lo"
            gms.lb[var] = boundVal
        elseif attr == "l"
            gms.l[var] = boundVal
        elseif attr == "fx"
            gms.fx[var] = boundVal
        elseif attr == "up"
            gms.ub[var] = boundVal
        elseif attr == "m"
            gms.m[var] = boundVal
        elseif attr == "scale"
            gms.scale[var] = boundVal
        elseif attr == "prior"
            gms.prior[var] = boundVal
        elseif attr == "stage"
            gms.prior[var] = boundVal
        else
            error("Unknown variable attribute. Consult gams hand-book for definition and report this issue.")
        end
    end

    return
end

function read_model(file::IOStream, gms::oneProblem, lInit::AbstractString; kwargs...)

    # Assume this will always be one line
	@assert strip(lInit, ['\n','\r'])[end] == ';'
    sl = split(strip(lInit,[';','\n','\r']), r" |,")
    @assert sl[1] == "Model"  # Already did outside
    # Not sure if the printlnrmation stored here is useful or not.
    for i in 1:length(sl)
        if sl[i] == "Model"
            gms.modelSymbol = sl[i+1]
        end
    end

    return
end

function read_solve(file::IOStream, gms::oneProblem, lInit::AbstractString; kwargs...)

	@assert strip(lInit, ['\n','\r'])[end] == ';'

    sl = split(strip(lInit, [';','\n','\r']), r" |,")
    @assert sl[1] == "Solve"

    for i in 1:length(sl)
        if sl[i] in PROBTYPE
            gms.modelType = sl[i]
        elseif sl[i] == "maximizing"
            gms.objSense = sl[i]
        elseif sl[i] == "minimizing"
            gms.objSense = sl[i]
        elseif sl[i] in gms.cols
            gms.objective = sl[i]
        end
    end
end

function gms2jump(gmsPath::AbstractString;
                    mode::AbstractString="index",
                    ending="m=m",
                    quadNL::Bool=false,
                    loopifpossible::Bool=true,
                    outdir::AbstractString="")

    probName = replace(splitdir(gmsPath)[end],".gms", "")
    gms = read_gms_file(gmsPath)
    write_julia_script(probName, gms, mode, loopifpossible=loopifpossible, quadNL=quadNL, outdir=outdir)

    return
end
