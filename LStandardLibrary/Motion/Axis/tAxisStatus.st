NAMESPACE stdLib.Motion
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
