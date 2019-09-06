NAMESPACE stdLib
    TYPE
        tAxisParameter : STRUCT
            // dynamic values
            maxVelocity : LREAL := 5.0;
            acceleration : LREAL;
            velocity : LREAL;
            
            // mechanical values
            maxPosition : DINT;
            position : DINT;

        END_STRUCT;
    END_TYPE
END_NAMESPACE