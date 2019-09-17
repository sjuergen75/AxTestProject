// Basic configuration, check documentation: https://dev.axcite.me/docs/st-language/programming.html#configuration

(*
PROGRAM TestProgramm /* name of the program */

    VAR_EXTERNAL
        DI_0_0 : BOOL;
        DQ_0_0 : BOOL;
        DQ_0_1 : BOOL;

        // PushButton S100
        S100 : stdLib.SignalHandling.BinSignal;
        // Bulb H100
        H100 : stdLib.SignalHandling.BinOutput;
        // DQ for Motor
        Q_M1 : stdLib.SignalHandling.BinOutput;
        // Motor M1

        PushButton : Application.PushButton;
        Bulb : Application.Bulb;
        M1 : Application.Motor;

    END_VAR
    VAR_TEMP
        res : stdLib.SignalHandling.BinSignalStatus;
    END_VAR
        
    res := S100.Set(signal := DI_0_0);       
    
    //#######################################
    // Musterlösung OOP
    //#######################################
    PushButton.RefToSetSignal(switch := S100);
    
    IF (PushButton.clicked()) THEN 
        Bulb.Toggle(H100);
    END_IF;
    
  
    //#####################################
    // alternative 
    //#####################################
    IF (S100.QRis()) THEN
        H100.Toggle();    
    END_IF;



    //Alternative 2
    if (res.QRis) then 
        H100.Toggle();
    end_if;

    H100.RefToOutput(Q => DQ_0_0);
    Q_M1.RefToOutput(Q => DQ_0_1);    

END_PROGRAM
*)