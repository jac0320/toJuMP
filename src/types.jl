type oneProblem
    modelSymbol ::AbstractString
    modelType   ::AbstractString
    objSense    ::AbstractString
    objective   ::AbstractString    # Should be objCol not var
    rows        ::Array
    cols        ::Array
    rowsLabel   ::Dict          #?
    lb          ::Dict          # Variable upper bound
    ub          ::Dict          # Variable lower bound
    l           ::Dict          # Level or primal value
    m           ::Dict          # Marginal or dual value
    fx          ::Dict          # Fixed value
    scale       ::Dict          # Numercial scaling factor [RARE]
    prior       ::Dict          # Branching priority
    stage       ::Dict          # Block structure stage
    rowsLHS     ::Dict          # LHS of constraints TODO: make it expresion ?
    rowsRHS     ::Dict          # RHS of constraints TODO: make sure rhs is always a value
    rowsSense   ::Dict          # Equation Sense
    colsType    ::Dict          #?
    comments    ::Array
    vars        ::Dict          # Advanced variablek
    vars2cols   ::Dict          # Links raw column names to variables with indices
    cols2vars   ::Dict          # Links indexed variables to raw column names
    biVars      ::Dict
    partVars    ::Array
    oneProblem() = new("", "", "", "",
                        [], [],
                        Dict(), Dict(), Dict(), Dict(), Dict(), Dict(), Dict(), Dict(), Dict(), Dict(), Dict(), Dict(), Dict(),
                        [],
                        Dict(), Dict(), Dict(), Dict(),
                        [])
end
