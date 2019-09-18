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
        myTrafficLight : Application.TrafficLight;
    END_VAR 
    myTrafficLight.Initialize();
    myTrafficLight.Execute(sysLibTimer := sysLibTimer, QRed => DQ_0_2, QYellow => DQ_0_1, QGreen => DQ_0_0);
    (*
    IF (NOT(isInitialized)) THEN
        stateINIT.Config(monitoringTime := DINT#4000);
        stateGreen.Config(monitoringTime := DINT#2000);
        stateYellow.Config(monitoringTime := DINT#2000);
        stateRedYe.Config(monitoringTime := DINT#2000);
        stateRed.Config(monitoringTime := DINT#2000);
        
        stateINIT.Activate();
        isInitialized := true;
    END_IF;

    stateINIT.Execute(sysLibTimer := sysLibTimer);
    stateGreen.Execute(sysLibTimer := sysLibTimer);
    stateYellow.Execute(sysLibTimer := sysLibTimer);
    stateRed.Execute(sysLibTimer := sysLibTimer);
    stateRedYe.Execute(sysLibTimer := sysLibTimer);

    //#############################################################
    // Light Control
    //#############################################################
    IF (stateINIT.IsActive()) THEN
        lampGreen.Set(value := TRUE, Q := Signal_0_0_gn);
        lampYellow.Set(value := TRUE, Q := Signal_0_1_ye);
        lampRed.Set(value := TRUE, Q := Signal_0_2_rd);        
    END_IF;
    IF (stateINIT.OnTimeout(refNextState := stateRed)) THEN
        lampGreen.Set(value := FALSE, Q := Signal_0_0_gn);
        lampYellow.Set(value := FALSE, Q := Signal_0_1_ye);
        lampRed.Set(value := FALSE, Q := Signal_0_2_rd);    
    END_IF;



    //------------------------------------
    // State Phase 2 --> Yellow
    //------------------------------------
    IF (stateYellow.OnEntry()) THEN
        lampYellow.Set(value := true, Q := Signal_0_1_ye); // Switch on yellow light
    END_IF;
    IF (stateYellow.OnTimeOut(refNextState := stateGreen)) THEN
        lampYellow.Set(value := false, Q := Signal_0_1_ye); // Switch off yellow light
    END_IF;
    
    //------------------------------------
    // State Phase 3 --> Green Light
    //------------------------------------
    IF (stateGreen.OnEntry()) THEN
        lampGreen.Set(value := true, Q := Signal_0_0_gn); // Switch on green light
    END_IF;
    IF (stateGreen.OnTimeOut(refNextState := stateRed)) THEN
        lampGreen.Set(value := false, Q := Signal_0_0_gn); // Switch off green light
    END_IF;

    //##########################################
    // Write Outputs
    //##########################################
    Signal_0_0_gn.RefToOutput(DQ_0_0);
    Signal_0_1_ye.RefToOutput(DQ_0_1);
    Signal_0_2_rd.RefToOutput(DQ_0_2);
    *)
    ;
END_PROGRAM