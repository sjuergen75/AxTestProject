NAMESPACE stdLib
    TYPE
        tAxisStatus : STRUCT
            actPosition : DINT;
            isRunning : BOOL;
            hasFault : BOOL;
        END_STRUCT;
    END_TYPE

    //TYPE 
    //    arrayOfStruct : ARRAY[0..1] of tAxisStatus := ;
    //END_TYPE
    
END_NAMESPACE

NAMESPACE Aa
    FUNCTION funcA : Int
        VAR_INPUT
        END_VAR
        VAR_TEMP
        END_VAR
            funcA := 0;
            ;
    END_FUNCTION
    
    NAMESPACE INTERNAL inner
        FUNCTION innerFunc : Int
            VAR_INPUT
            END_VAR
            VAR_TEMP
            END_VAR
        
                innerFunc := 1;
        END_FUNCTION
    END_NAMESPACE

    FUNCTION tAxisStatus : Int
        VAR_INPUT
        END_VAR
        VAR_TEMP
            ret : INT;
        END_VAR
        tAxisStatus := inner.innerFunc();

            ;
    END_FUNCTION
END_NAMESPACE
