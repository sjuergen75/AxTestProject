NAMESPACE stdLib.Statemachine

    CLASS State
        VAR
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

            m_tonMonitoringTime.Execute(sysLibTimer := sysLibTimer);
            m_stateHasLeft := false; 
            m_stateHasEnterd := false;
                   

            IF (m_tonMonitoringTime.Q()) THEN
                m_timeout := true;
                m_tonMonitoringTime.Reset();
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
        METHOD PUBLIC NewState
            VAR_IN_OUT
                newState1 : State;
            END_VAR
            //newState1.Activate();
            
            m_stepIsActive := false;
            m_stateHasLeft := true;
        END_METHOD

        METHOD PUBLIC Activate
            m_stateHasEnterd := true;
            m_stepIsActive := true;
            m_timeout := false;
            m_tonMonitoringTime.Start(PT := m_monitoringTime);        
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
        METHOD PUBLIC HasLeft : BOOL
            HasLeft := m_stateHasLeft;
        END_METHOD

        //---------------------------------------------
        // State has been entered
        //---------------------------------------------        
        METHOD PUBLIC HasEntered : BOOL
            HasEntered := m_stateHasEnterd;
        END_METHOD

        //---------------------------------------------
        // State monitoring time has been elapsed
        //---------------------------------------------        
        METHOD PUBLIC OnTimeOut : BOOL
            OnTimeOut := m_timeout;
        END_METHOD


    END_CLASS

END_NAMESPACE