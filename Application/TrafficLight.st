NAMESPACE Application

    CLASS TrafficLight
        VAR
            m_isInitialized : BOOL;
            m_isActivated : BOOL;
            m_stateINIT : stdLib.Statemachine.State;
            m_stateRed : stdLib.Statemachine.State;
            m_stateRedYe : stdLib.Statemachine.State;
            m_stateGreen : stdLib.Statemachine.State;
            m_stateYellow : stdLib.Statemachine.State;            

            m_lampGreen : Application.Bulb;
            m_lampYellow : Application.Bulb;
            m_lampRed : Application.Bulb;  

            m_Signal_0_0_gn : stdLib.SignalHandling.BinOutput;
            m_Signal_0_1_ye : stdLib.SignalHandling.BinOutput;
            m_Signal_0_2_rd : stdLib.SignalHandling.BinOutput;
        END_VAR

        //-----------------------------------------------------
        // Cyclic execution of Traffic light
        //-----------------------------------------------------
        METHOD PUBLIC Execute
            VAR_INPUT
                sysLibTimer : DINT;            
            END_VAR

            IF (m_isInitialized) THEN
                IF (NOT(m_isActivated)) THEN
                    m_isActivated := TRUE;
                    m_stateINIT.Activate();
                END_IF;
                //cyclic execution of states 
                m_stateINIT.Execute(sysLibTimer := sysLibTimer);
                m_stateGreen.Execute(sysLibTimer := sysLibTimer);
                m_stateYellow.Execute(sysLibTimer := sysLibTimer);
                m_stateRed.Execute(sysLibTimer := sysLibTimer);
                m_stateRedYe.Execute(sysLibTimer := sysLibTimer);

                // state handling
                this.PhaseInit();
                this.PhaseRed();
                this.PhaseRedYellow();
                this.PhaseGreen();
                this.PhaseYellow();
                
            END_IF;

        END_METHOD
    
        METHOD PhaseInit
            IF (m_stateINIT.IsActive()) THEN
                m_lampGreen.Set(value := TRUE, Q := m_Signal_0_0_gn);
                m_lampYellow.Set(value := TRUE, Q := m_Signal_0_1_ye);
                m_lampRed.Set(value := TRUE, Q := m_Signal_0_2_rd);        
            END_IF;
            IF (m_stateINIT.OnTimeout(refNextState := m_stateRed)) THEN
                m_lampGreen.Set(value := FALSE, Q := m_Signal_0_0_gn);
                m_lampYellow.Set(value := FALSE, Q := m_Signal_0_1_ye);
                m_lampRed.Set(value := FALSE, Q := m_Signal_0_2_rd);    
            END_IF;
        END_METHOD

        //------------------------------------
        // State Phase --> Red Light
        //------------------------------------
        METHOD PhaseRed
            IF (m_stateRed.OnEntry()) THEN
                m_lampRed.Set(value := true, Q := m_Signal_0_2_rd); // Switch on red light
            END_IF;
            IF (m_stateRed.OnTimeOut(refNextState := m_stateGreen)) THEN
                m_lampRed.Set(value := false, Q := m_Signal_0_2_rd); // Switch off red light    
            END_IF;
        END_METHOD

        //------------------------------------
        // State Phase --> Red Yellow
        //------------------------------------
        METHOD PhaseRedYellow
            
            // implement your code here
            ;
        END_METHOD

        //------------------------------------
        // State Phase --> Green
        //------------------------------------
        METHOD PhaseGreen
            IF (m_stateGreen.OnEntry()) THEN
                m_lampGreen.Set(value := true, Q := m_Signal_0_0_gn); // Switch on green light
            END_IF;
            IF (m_stateGreen.OnTimeOut(refNextState := m_stateYellow)) THEN
                m_lampGreen.Set(value := false, Q := m_Signal_0_0_gn); // Switch off green light
            END_IF;                
        END_METHOD

        //------------------------------------
        // State Phase --> Yellow
        //------------------------------------
        METHOD PhaseYellow
            IF (m_stateYellow.OnEntry()) THEN
                m_lampYellow.Set(value := true, Q := m_Signal_0_1_ye); // Switch on yellow light
            END_IF;
            IF (m_stateYellow.OnTimeOut(refNextState := m_stateRed)) THEN
                m_lampYellow.Set(value := false, Q := m_Signal_0_1_ye); // Switch off yellow light
            END_IF;
        END_METHOD

        //------------------------------------
        // Write digital Outputs
        //------------------------------------
        METHOD PUBLIC WriteOutputs
            VAR_OUTPUT
                QRed : BOOL;
                QYellow : BOOL;
                QGreen : BOOL;
            END_VAR
            m_Signal_0_2_rd.RefToOutput(QRed);
            m_Signal_0_1_ye.RefToOutput(QYellow);
            m_Signal_0_0_gn.RefToOutput(QGreen);
        END_METHOD

        METHOD PUBLIC Initialize
            VAR_INPUT
                durationInitPhase : DINT := DINT#4000; // default 2000ms
                durationRedPhase : DINT := DINT#2000; // default 2000ms
                durationRedYellowPhase : DINT := DINT#2000; // default 2000ms
                durationGreenPhase : DINT := DINT#2000; // default 2000ms
                durationYellowPhase : DINT := DINT#2000; // default 2000ms                
            END_VAR
            
            IF (NOT(m_isInitialized)) THEN
                m_isInitialized := TRUE;
                m_stateINIT.Config(monitoringTime := durationInitPhase);
                m_stateGreen.Config(monitoringTime := durationGreenPhase);
                m_stateYellow.Config(monitoringTime := durationYellowPhase);
                m_stateRedYe.Config(monitoringTime := durationRedYellowPhase);
                m_stateRed.Config(monitoringTime := durationRedPhase);
                m_stateINIT.Activate();
            END_IF;
        END_METHOD

    END_CLASS
END_NAMESPACE