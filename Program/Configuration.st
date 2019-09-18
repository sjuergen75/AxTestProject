CONFIGURATION PLC_1

    var_global
        sysLibTimer : DINT;

        DI_0_0 AT %I0.0 : BOOL;
        DQ_0_0 AT %Q0.0 : BOOL;
        DQ_0_1 AT %Q0.1 : BOOL;
        DQ_0_2 AT %Q0.2 : BOOL;
        
        S100 : stdLib.SignalHandling.BinSignal;
        H100 : stdLib.SignalHandling.BinOutput;
        Q_M1 : stdLib.SignalHandling.BinOutput;

        PushButton : Application.PushButton;
        Bulb : Application.Bulb;
        M1 : Application.Motor;
        

        //--------------------------------------------------
        // Programm Light LightStack
        //--------------------------------------------------
        isInitialized : BOOL;
        Signal_0_0_gn : stdLib.SignalHandling.BinOutput;
        Signal_0_1_ye : stdLib.SignalHandling.BinOutput;
        Signal_0_2_rd : stdLib.SignalHandling.BinOutput;

        lampRed : Application.Bulb;
        lampYellow : Application.Bulb;
        lampGreen : Application.Bulb;

        stateINIT : stdLib.Statemachine.State;
        stateRed : stdLib.Statemachine.State;
        stateRedYe : stdLib.Statemachine.State;
        stateGreen : stdLib.Statemachine.State;
        stateYellow : stdLib.Statemachine.State;    
        myTrafficLight : Application.TrafficLight;
        
    end_var

    TASK Main(Priority := 1);
    TASK System(Interval := T#10ms, Priority := 1);    

    //PROGRAM P1 WITH Main : TestProgramm;
    PROGRAM PLightStack WITH Main : LightStack;
    PROGRAM P2 WITH System : Timer;

END_CONFIGURATION