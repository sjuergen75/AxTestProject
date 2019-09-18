// Basic configuration, check documentation: https://dev.axcite.me/docs/st-language/programming.html#configuration


PROGRAM LightStack /* name of the program */

    VAR_EXTERNAL
        isInitialized : BOOL;
        sysLibTimer : DINT;

        DQ_0_0 : BOOL;
        DQ_0_1 : BOOL;
        DQ_0_2 : BOOL;

        Signal_0_0_gn : stdLib.SignalHandling.BinOutput;
        Signal_0_1_ye : stdLib.SignalHandling.BinOutput;
        Signal_0_2_rd : stdLib.SignalHandling.BinOutput;

        lampGreen : Application.Bulb;
        lampYellow : Application.Bulb;
        lampRed : Application.Bulb;

        stateINIT : stdLib.Statemachine.State;
        stateRed : stdLib.Statemachine.State;
        stateRedYe : stdLib.Statemachine.State;
        stateGreen : stdLib.Statemachine.State;
        stateYellow : stdLib.Statemachine.State;    

    END_VAR 
    VAR_TEMP
        res : stdLib.SignalHandling.BinSignalStatus;
    END_VAR
    
    IF (NOT(isInitialized)) THEN
        stateINIT.Config(monitoringTime := DINT#4000);
        stateGreen.Config(monitoringTime := DINT#2000);
        stateYellow.Config(monitoringTime := DINT#2000);
        stateRed.Config(monitoringTime := DINT#2000);
        
        stateINIT.Activate();
        isInitialized := true;
    END_IF;

    stateINIT.Execute(sysLibTimer := sysLibTimer);
    stateGreen.Execute(sysLibTimer := sysLibTimer);
    stateYellow.Execute(sysLibTimer := sysLibTimer);
    stateRed.Execute(sysLibTimer := sysLibTimer);

    //-----------------------------
    // Light Control
    //-----------------------------
    IF (stateINIT.IsActive()) THEN
        lampGreen.Set(value := TRUE, Q := Signal_0_0_gn);
        lampYellow.Set(value := TRUE, Q := Signal_0_1_ye);
        lampRed.Set(value := TRUE, Q := Signal_0_2_rd);
        
    END_IF;
    IF (stateINIT.OnTimeout()) THEN
        lampGreen.Set(value := FALSE, Q := Signal_0_0_gn);
        lampYellow.Set(value := FALSE, Q := Signal_0_1_ye);
        lampRed.Set(value := FALSE, Q := Signal_0_2_rd);
        stateINIT.NewState(refNewState := stateRed);
    END_IF;

    //------------------------------------
    // State Phase 1 --> Red Light
    //------------------------------------
    IF stateRed.OnTimeOut() THEN
        stateRed.NewState(refNewState := stateYellow);
    END_IF;

    IF (stateRed.HasEntered()) THEN
        lampRed.Set(value := true, Q := Signal_0_2_rd); // Switch on red light
    END_IF;
    IF (stateRed.HasLeft()) THEN
        lampRed.Set(value := false, Q := Signal_0_2_rd); // Switch off red light    
    END_IF;

    //------------------------------------
    // State Phase 2 --> Yellow
    //------------------------------------
    IF stateYellow.OnTimeOut() THEN        
        stateYellow.NewState(refNewState := stateGreen);
    END_IF;

    IF (stateYellow.HasEntered()) THEN
        lampYellow.Set(value := true, Q := Signal_0_1_ye); // Switch on yellow light
    END_IF;
    IF (stateYellow.HasLeft()) THEN
        lampYellow.Set(value := false, Q := Signal_0_1_ye); // Switch off yellow light
    END_IF;
    
    //------------------------------------
    // State Phase 3 --> Green Light
    //------------------------------------
    IF stateGreen.OnTimeOut() THEN
        stateGreen.NewState(refNewState := stateGreen);
    END_IF;

    IF (stateGreen.HasEntered()) THEN
        lampGreen.Set(value := true, Q := Signal_0_0_gn); // Switch on green light
    END_IF;
    IF (stateGreen.HasLeft()) THEN
        lampGreen.Set(value := false, Q := Signal_0_0_gn); // Switch off green light
    END_IF;

    //##########################################
    // Write Outputs
    //##########################################
    Signal_0_0_gn.RefToOutput(DQ_0_0);
    Signal_0_1_ye.RefToOutput(DQ_0_1);
    Signal_0_2_rd.RefToOutput(DQ_0_2);
    
    ;
END_PROGRAM