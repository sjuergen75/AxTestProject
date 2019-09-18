CONFIGURATION PLC_1

    var_global
        //--------------------------------
        // Global variable for Timers
        //--------------------------------
        sysLibTimer : DINT;

        //----------------------------------------
        // Global variable for another program
        //----------------------------------------
        DI_0_0 AT %I0.0 : BOOL;
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
        DQ_0_0_gn AT %Q0.0 : BOOL;
        DQ_0_1_ye AT %Q0.1 : BOOL;
        DQ_0_2_rd AT %Q0.2 : BOOL;
        myTrafficLight : Application.TrafficLight;
        
    end_var

    TASK Main(Priority := 1);
    TASK System(Interval := T#10ms, Priority := 1);    

    //PROGRAM P1 WITH Main : TestProgramm;
    PROGRAM PLightStack WITH Main : LightStack;
    PROGRAM P2 WITH System : Timer;

END_CONFIGURATION