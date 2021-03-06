pkgdir = "$(Pkg.dir("toJuMP"))"

@testset "gms/4stufen.gms" begin
    name = "4stufen"

    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)
    @test m.objSense == :Min
    @test length(m.colVal) == 150
    @test length([i for i in m.colCat if i == :Cont]) == 102
    @test length([i for i in m.colCat if i == :Bin]) == 48

    @test getlowerbound(Variable(m, 13)) == 5
    @test getvalue(Variable(m, 33)) == 176.503

end

@testset "gms/abel.gms" begin
    name = "abel"

    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)
    @test m.objSense == :Min
    @test length(m.colVal) == 31
    @test length([i for i in m.colCat if i == :Cont]) == 31

    @test getlowerbound(Variable(m, 2)) == 387.9
    @test getupperbound(Variable(m, 2)) == 387.9
    @test getlowerbound(Variable(m, 10)) == 85.3
    @test getupperbound(Variable(m, 10)) == 85.3
    @test getvalue(Variable(m, 3)) == 387.9

    setsolver(m, IpoptSolver(print_level=0))
    solve(m)
    @test isapprox(m.objVal, 225.1945831861349;atol=1e-4)
end

@testset "gms/alkyl.gms" begin
    name = "alkyl"
    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)
    @test m.objSense == :Min
    @test length(m.colVal) == 15
    @test length([i for i in m.colCat if i == :Cont]) == 15
    @test getvalue(Variable(m,1)) == -0.9
    @test getvalue(Variable(m,15)) == 1
    @test getlowerbound(Variable(m, 2)) == 0.0
    @test getupperbound(Variable(m, 2)) == 2
    @test getlowerbound(Variable(m, 3)) == 0.0
    @test getupperbound(Variable(m, 3)) == 1.6
    @test getlowerbound(Variable(m, 4)) == 0.0
    @test getupperbound(Variable(m, 4)) == 1.2
    @test getlowerbound(Variable(m, 7)) == 0.85
    @test getupperbound(Variable(m, 9)) == 12
    @test getlowerbound(Variable(m, 14)) == 0.9
    @test getupperbound(Variable(m, 15)) == 1.01010101010101

    setsolver(m, IpoptSolver(print_level=0))
    solve(m)
    @test isapprox(m.objVal, -1.7650001749159285;atol=1e-4)
end

@testset "gms/autocorr_bern20-03.gms" begin
    name = "autocorr_bern20-03"

    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)
    @test m.objSense == :Min
    @test length(m.colVal) == 21
    @test length([i for i in m.colCat if i == :Cont]) == 1
    @test length([i for i in m.colCat if i == :Bin]) == 20
end

@testset "gms/bearing.gms" begin
    name = "bearing"
    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)
    @test m.objSense == :Min
    @test length(m. colVal) == 14
    @test length([i for i in m.colCat if i == :Cont]) == 14
    @test getvalue(Variable(m, 2)) == 6
    @test getvalue(Variable(m, 3)) == 5
    @test getvalue(Variable(m, 10)) == 50
    @test getlowerbound(Variable(m, 2)) == 1
    @test getupperbound(Variable(m, 2)) == 16
    @test getlowerbound(Variable(m, 6)) == 1
    @test getupperbound(Variable(m, 6)) == 1000
    @test getupperbound(Variable(m, 2)) == 16

    setsolver(m, IpoptSolver(print_level=0))
    solve(m)
    @test isapprox(m.objVal, 1.9517331852884277;atol=1e-4)
end

@testset "gms/camcge.gms" begin
    name = "camcge"
    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)

    @test m.objSense == :Min
    @test length(m.colVal) == 280
    @test length([i for i in m.colCat if i == :Cont]) == 280
    @test length([i for i in m.colCat if i == :Bin]) == 0

    @test getlowerbound(Variable(m, 101)) == 0.0
    @test getlowerbound(Variable(m, 172)) == 0.0
    @test getlowerbound(Variable(m, 200)) == 0.0

    setsolver(m, IpoptSolver(print_level=0))
    solve(m)
    @test isapprox(m.objVal, -191.73462423686072;atol=1e-4)
end

@testset "gms/ex4_1_3.gms" begin
    name = "ex4_1_3"

    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)

    @test m.objSense == :Min
    @test length(m.colVal) == 2
    @test length([i for i in m.colCat if i == :Cont]) == 2
    @test length([i for i in m.colCat if i == :Bin]) == 0

    setsolver(m, IpoptSolver(print_level=0))
    solve(m)
    @test isapprox(m.objVal, -443.67170474112413;atol=1e-4)
end

@testset "gms/ex7_3_5.gms" begin
    name = "ex7_3_5"

    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)

    @test m.objSense == :Min
    @test length(m.colVal) == 14
    @test length([i for i in m.colCat if i == :Cont]) == 14
    @test length([i for i in m.colCat if i == :Bin]) == 0

    setsolver(m, IpoptSolver(print_level=0))
    status = solve(m)
    @test status == :Error
end

@testset "gms/ex14_2_4.gms" begin
    name = "ex14_2_4"

    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)

    @test m.objSense == :Min
    @test length(m.colVal) == 6
    @test length([i for i in m.colCat if i == :Cont]) == 6
    @test length([i for i in m.colCat if i == :Bin]) == 0

    setsolver(m, IpoptSolver(print_level=0))
    solve(m)
    @test isapprox(m.objVal, 7.562126836459202e-9;atol=1e-4)
end

@testset "gms/ex14_2_8.gms" begin
    name = "ex14_2_8"

    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)

    @test m.objSense == :Min
    @test length(m.colVal) == 5
    @test length([i for i in m.colCat if i == :Cont]) == 5
    @test length([i for i in m.colCat if i == :Bin]) == 0

    setsolver(m, IpoptSolver(print_level=0))
    solve(m)
    @test isapprox(m.objVal, 2.624689270273677e-9;atol=1e-4)
end

@testset "gms/st_rv1.gms" begin
    name = "st_rv1"

    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)

    @test m.objSense == :Min
    @test length(m.colVal) == 11
    @test length([i for i in m.colCat if i == :Cont]) == 11
    @test length([i for i in m.colCat if i == :Bin]) == 0

    setsolver(m, IpoptSolver(print_level=0))
    solve(m)
    @test isapprox(m.objVal, -59.904345906908;atol=1e-4)
end

@testset "gms/water.gms" begin
    name = "water"

    gmspath = joinpath(pkgdir, "test", "examples", "gms", "$(name).gms")
    jlpath = joinpath(pkgdir, ".jls", "$(name).jl")

    gms2jump(gmspath)
    m = include(jlpath)
    @test isa(m, JuMP.Model)

    @test m.objSense == :Min
    @test length(m.colVal) == 42
    @test length([i for i in m.colCat if i == :Cont]) == 42
    @test length([i for i in m.colCat if i == :Bin]) == 0

    setsolver(m, IpoptSolver(print_level=0))
    status = solve(m)
    @test status == :Error
end
