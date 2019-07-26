CLASS cAxis

    VAR PUBLIC
        mParameter : tAxisParameter;
        mStatus : tAxisStatus;
    END_VAR

    VAR PRIVATE
        mRun : BOOL;
        mPosition : DINT;
        //mStatus : tAxisStatus;
    END_VAR

    METHOD PUBLIC  GetStatus : tAxisStatus
        GetStatus := mStatus;

    END_METHOD

    METHOD PUBLIC GetPos : DINT
        GetPos := mPosition;
    END_METHOD
    //--------------------------------------
    // Homing 
    //--------------------------------------
    METHOD Homing : BOOL
        VAR_INPUT
        END_VAR
        VAR_TEMP
        END_VAR
    
            Homing := true;

    END_METHOD

    METHOD public execute
        VAR_INPUT
            run : BOOL;
        END_VAR
        VAR_OUTPUT
            motorOn : BOOL; 
        END_VAR
        motorOn := run;
        mRun := motorOn;
        //if (motorOn = true) then 
           // mStatus.actPosition := mStatus.actPosition + DINT#1;
        //end_if;
        mPosition := mPosition + DINT#1;
        //mStatus.actPosition := mPosition;
    END_METHOD
    


    METHOD init
        VAR_INPUT
            parameter : tAxisParameter;
        END_VAR
        ;
        parameter.velocity := 0.0;
        parameter.position := DINT#0;
    END_METHOD

END_CLASS