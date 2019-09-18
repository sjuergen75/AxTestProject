NAMESPACE stdLib.Statemachine

    CLASS State
        VAR
            m_RequestActivation : BOOL;
            m_StepId : UINT;
            m_stepIsActive : BOOL;
            m_stateHasLeft : BOOL;
            m_stateHasEnterd : BOOL;            
            m_timeout : BOOL; 
            m_monitoringTime : DINT;
            m_tonMonitoringTime : stdLib.Timer.OnDelay;            
        END_VAR
        
        //------------------------------------
        // Cyclic execution of state
        //------------------------------------
        METHOD PUBLIC Execute
            VAR_INPUT                
                sysLibTimer : DINT;                
            END_VAR

            // Reset HasEntered after one PLC cycle
            IF (m_stateHasEnterd) THEN
                m_stateHasEnterd := FALSE;
            END_IF;

            // Reset HasLeft after one PLC cycle
            IF (m_stateHasLeft) THEN
                m_stateHasLeft := FALSE;
            END_IF;    

            // Activate State if it is requested
            // --> State will be activated one PLC Cycle later
            IF (m_RequestActivation) THEN
                m_RequestActivation := FALSE;
                m_stateHasEnterd := TRUE;
                m_stepIsActive := TRUE;
                IF (m_monitoringTime > DINT#0) THEN
                    m_tonMonitoringTime.Start(PT := m_monitoringTime);                   
                END_IF;
            END_IF;
            
            m_timeout := FALSE;            
            m_timeout := this.CheckTimeOut(sysLibTimer);

        END_METHOD

        //----------------------------------
        // private method CheckTimeout
        // checks when timeout is happened
        //----------------------------------
        METHOD CheckTimeOut : BOOL
            VAR_INPUT
                sysLibTimer : DINT;
            END_VAR            
            IF (m_monitoringTime > DINT#0) THEN
                m_tonMonitoringTime.Execute(sysLibTimer := sysLibTimer);            
                IF (m_tonMonitoringTime.Q()) THEN
                    CheckTimeOut := TRUE;
                    m_tonMonitoringTime.Reset();
                ELSE
                    CheckTimeOut := FALSE;
                END_IF;
            ELSE
                CheckTimeOut := FALSE;
            END_IF;            
        END_METHOD

        //-------------------------------
        // State Configuaration
        //-------------------------------
        METHOD PUBLIC Config
            VAR_INPUT
                monitoringTime : DINT;
            END_VAR
            m_monitoringTime := monitoringTime;            
        END_METHOD

        //-----------------------------------------
        // Activate new step
        //-----------------------------------------
        METHOD PUBLIC NextState
            VAR_IN_OUT
                refNextState : State;
            END_VAR

            // Only a active state can activate an another state
            IF (m_stepIsActive) THEN
                refNextState.Activate();
            END_IF;            

            m_stepIsActive := false;
            m_stateHasLeft := true;
        END_METHOD


        METHOD PUBLIC Activate
            // Only a active state can activate an another state
            m_RequestActivation := true;    
        END_METHOD

        //###################################################################
        // "Properties"
        //###################################################################        
        
        //---------------------------------------------
        // State is active
        //---------------------------------------------        
        METHOD PUBLIC IsActive : BOOL
            IsActive := m_stepIsActive;
        END_METHOD

        //---------------------------------------------
        // State has left by any transition
        //---------------------------------------------        
        METHOD PUBLIC OnExit : BOOL
            OnExit := m_stateHasLeft;
        END_METHOD

        //---------------------------------------------
        // State has been entered
        //---------------------------------------------        
        METHOD PUBLIC OnEntry : BOOL
            OnEntry := m_stateHasEnterd;
        END_METHOD

        //---------------------------------------------
        // State monitoring time has been elapsed
        // Activate next step 
        //---------------------------------------------        
        METHOD PUBLIC OnTimeOut : BOOL
            VAR_IN_OUT
                refNextState : State;
            END_VAR            
            IF (m_timeout) THEN
                this.NextState(refNextState := refNextState);
            END_IF;
            
            OnTimeOut := m_timeout;
        END_METHOD
    END_CLASS

END_NAMESPACE