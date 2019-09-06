NAMESPACE A
    NAMESPACE  Aa
        FUNCTION inner : Int
            VAR_INPUT
            END_VAR
            VAR_TEMP
            END_VAR
            inner := 1;
                            ;
        END_FUNCTION
    END_NAMESPACE
    FUNCTION test : Int
        VAR_INPUT
        END_VAR
        VAR_TEMP
        END_VAR
        B.test();
        test  := 0;
            ;
    END_FUNCTION
END_NAMESPACE

NAMESPACE B
    FUNCTION test : Int
        VAR_INPUT
        END_VAR
        VAR_TEMP
        END_VAR
           A.aa.inner();
            test := 1;
            ;
    END_FUNCTION

END_NAMESPACE
