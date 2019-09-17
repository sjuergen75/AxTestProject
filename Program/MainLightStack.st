// Basic configuration, check documentation: https://dev.axcite.me/docs/st-language/programming.html#configuration


PROGRAM LightStack /* name of the program */

    VAR_EXTERNAL
        isInitialized : BOOL;

        DQ_0_0 : BOOL;
        DQ_0_1 : BOOL;
        DQ_0_2 : BOOL;

        Signal_0_0 : stdLib.SignalHandling.BinOutput;
        Signal_0_1 : stdLib.SignalHandling.BinOutput;
        Signal_0_2 : stdLib.SignalHandling.BinOutput;

        lampRed : Application.Bulb;
        lampYellow : Application.Bulb;
        lampGreen : Application.Bulb;

        stateINIT : stdLib.Statemachine.State;
        stateRed : stdLib.Statemachine.State;
        stateYellow : stdLib.Statemachine.State;
        stateGreen : stdLib.Statemachine.State;

    END_VAR 
    VAR_TEMP
        res : stdLib.SignalHandling.BinSignalStatus;
    END_VAR
    
    IF (NOT(isInitialized)) THEN
        stateINIT.Config(monitoringTime := DINT#1000);
        stateRed.Config(monitoringTime := DINT#1000);
        stateYellow.Config(monitoringTime := DINT#1000);
        stateGreen.Config(monitoringTime := DINT#1000);
        
        stateINIT.Activate();
        
        isInitialized := true;
    END_IF;

    stateINIT.Execute();
    stateRed.Execute();
    stateYellow.Execute();
    stateGreen.Execute();

    
    stateINIT.NewState(newState := stateRed);

(*
    //-----------------------------
    // Light Control
    //-----------------------------
    IF (stateINIT.IsActive()) THEN
        lampRed.Set(value := false, Q := Signal_0_0);
        lampYellow.Set(value := false, Q := Signal_0_1);
        lampGreen.Set(value := false, Q := Signal_0_2);
    END_IF;

    //------------------------------------
    // State Red Light
    //------------------------------------
    IF stateRed.OnTimeOut() THEN
        stateYellow.Activate();
    END_IF;

    IF (stateRed.HasEntered()) THEN
        lampRed.Set(value := true, Q := Signal_0_0); // Switch on red light
    END_IF;
    IF (stateRed.HasLeft()) THEN
        lampRed.Set(value := false, Q := Signal_0_0); // Switch off red light    
    END_IF;

    //------------------------------------
    // State Yellow Light
    //------------------------------------
    IF stateYellow.OnTimeOut() THEN
        stateGreen.Activate();
    END_IF;

    IF (stateYellow.HasEntered()) THEN
        lampYellow.Set(value := true, Q := Signal_0_1); // Switch on yellow light
    END_IF;
    IF (stateYellow.HasLeft()) THEN
        lampYellow.Set(value := false, Q := Signal_0_1); // Switch off yellow light
    END_IF;
    
    //------------------------------------
    // State Green Light
    //------------------------------------
    IF stateGreen.OnTimeOut() THEN
        stateYellow.Activate();
    END_IF;

    IF (stateGreen.HasEntered()) THEN
        lampGreen.Set(value := true, Q := Signal_0_2); // Switch on green light
    END_IF;
    IF (stateGreen.HasLeft()) THEN
        lampGreen.Set(value := false, Q := Signal_0_2); // Switch off green light
    END_IF;

    //##########################################
    // Write Outputs
    //##########################################
    Signal_0_0.RefToOutput(DQ_0_0);
    Signal_0_1.RefToOutput(DQ_0_1);
    Signal_0_2.RefToOutput(DQ_0_2);
    *)
    ;
END_PROGRAM