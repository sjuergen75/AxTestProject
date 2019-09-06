TYPE 
    tDefaults : Struct
        a : int := 1;
        b : INT := 2;
        c : BOOL := true;
    END_STRUCT;
END_TYPE


TYPE
    Motor : STRUCT
        setPointSpeed : LREAL := 30.0;
        error, speed, lastSpeed : LREAL;
    END_STRUCT;
END_TYPE

TYPE 
    nArray : ARRAY[0..9] of INT := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

END_TYPE
