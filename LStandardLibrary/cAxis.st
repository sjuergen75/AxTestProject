CLASS cAxis

    VAR PUBLIC
        mParameter : tAxisParameter;
        m1 : tAxisParameter;
        mStatus : tAxisStatus;
    END_VAR

    VAR PRIVATE       
        mPosition : DINT;
        mAcceleration : LREAL;
        mDeceleration : LREAL;


        // internal status
        mBusy : BOOL;
        mDone : BOOL;
        mError : BOOL;
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
    METHOD PUBLIC Homing : BOOL
        VAR_INPUT
            velocity : LREAL;
            acceleration : LREAL;
            deceleration : LREAL;
            mode : INT;
        END_VAR
        VAR_TEMP
        END_VAR
    
            Homing := true;
                        
    END_METHOD

    
    //---------------------------------------------------
    // Reset
    //---------------------------------------------------
    METHOD Reset : BOOL
        VAR_INPUT
        END_VAR
        VAR_TEMP
        END_VAR
    
        Reset := true;
            ;
    END_METHOD

    //---------------------------------------------------
    // Halt
    //---------------------------------------------------
    METHOD Halt : BOOL
        VAR_INPUT
        END_VAR
        VAR_TEMP
        END_VAR
    
        Halt := true;
            ;
    END_METHOD

    //---------------------------------------------------
    // MoveVelocity
    //---------------------------------------------------
    METHOD PUBLIC MoveVelocity : BOOL
        VAR_INPUT
            velocity : LREAL;
            acceleration : LREAL;
            deceleration : LREAL;
        END_VAR        
        MoveVelocity := true;
    END_METHOD
    
    //---------------------------------------------------
    // MoveAbsolute
    //---------------------------------------------------
    METHOD PUBLIC MoveAbsolute : BOOL
        VAR_INPUT
            velocity : LREAL;
            position : DINT;
            acceleration : LREAL;
            deceleration : LREAL;
        END_VAR        
        MoveAbsolute := true;
    END_METHOD

    //---------------------------------------------------
    // MoveRelative
    //---------------------------------------------------
    METHOD PUBLIC MoveRelative : BOOL
        VAR_INPUT
            velocity : LREAL;
            position : DINT;
            acceleration : LREAL;
            deceleration : LREAL;
        END_VAR        
        MoveRelative := true;
    END_METHOD

    //---------------------------------------------------
    // SetAcceleration
    //---------------------------------------------------
    METHOD PUBLIC SetAcceleration
        VAR_INPUT
            accelleration : LREAL;
        END_VAR        
        mAcceleration := accelleration;
    END_METHOD

    //---------------------------------------------------
    // SetDeceleration
    //---------------------------------------------------
    METHOD PUBLIC SetDeceleration
        VAR_INPUT
            deceleration : LREAL;
        END_VAR        
        mDeceleration := deceleration;
    END_METHOD

    //---------------------------------------------------
    // IsBusy
    //---------------------------------------------------
    METHOD PUBLIC IsBusy : BOOL
        IsBusy := mBusy;
    END_METHOD

    //---------------------------------------------------
    // HasError
    //---------------------------------------------------
    METHOD PUBLIC HasError : BOOL
        HasError := mError;
    END_METHOD

    //---------------------------------------------------
    // IsDone
    //---------------------------------------------------
    METHOD PUBLIC IsDone : BOOL
        IsDone := mDone;
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