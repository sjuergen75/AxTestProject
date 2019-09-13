NAMESPACE stdLib.Motion
    CLASS Axis

        VAR PUBLIC
            mParameter : tAxisParameter;
            m1 : tAxisParameter;
            mStatus : tAxisStatus;
            run : BOOL;       
            faultActive : BOOL; 
        END_VAR

        VAR PRIVATE       
            mPosition : DINT;
            mAcceleration : LREAL;
            mDeceleration : LREAL;
            mPlcOpenStatus : enStatus;
        END_VAR

        METHOD PUBLIC Main        
            ;
        END_METHOD

        METHOD PUBLIC  GetStatus : enStatus
            GetStatus := mPlcOpenStatus;    
        END_METHOD


        METHOD PUBLIC  GetInfo : tAxisStatus
            GetInfo := mStatus;    
        END_METHOD

        METHOD PUBLIC GetPos : DINT
            GetPos := mPosition;
        END_METHOD
        
        //--------------------------------------
        // Homing 
        //--------------------------------------
        METHOD PUBLIC Homing : enStatus
            VAR_INPUT
                //velocity : LREAL;
                //acceleration : LREAL;
                //deceleration : LREAL;
                //mode : INT;
            END_VAR
            VAR_TEMP
                tempStatus : enStatus;
            END_VAR
                Homing := tempStatus;
        END_METHOD

        METHOD PRIVATE mHoming
            ;
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
            
            if (not(faultActive)) then 
                mPlcOpenstatus.busy := true;
                MoveVelocity := true;
            ELSE
                mPlcOpenstatus.error := true;
                mPlcOpenstatus.busy := false;
                MoveVelocity := false;
            END_IF;

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

        METHOD PUBLIC MoveAbsolute3 : BOOL
            VAR_INPUT
                velocity : LREAL;
                position : DINT;
                acceleration : LREAL;
                deceleration : LREAL;
            END_VAR        
            MoveAbsolute3 := true;
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


        METHOD init
            VAR_INPUT
                parameter : tAxisParameter;
            END_VAR
            ;
            parameter.velocity := 0.0;
            parameter.position := DINT#0;
        END_METHOD


    END_CLASS
END_NAMESPACE