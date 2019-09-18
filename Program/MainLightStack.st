PROGRAM LightStack /* name of the program */

    VAR_EXTERNAL
        isInitialized : BOOL;
        sysLibTimer : DINT;

        DQ_0_0_gn : BOOL;
        DQ_0_1_ye : BOOL;
        DQ_0_2_rd : BOOL;

        myTrafficLight : Application.TrafficLight;
    END_VAR 
    
    myTrafficLight.Initialize();
    myTrafficLight.Execute(sysLibTimer := sysLibTimer);
    myTrafficLight.WriteOutputs(QRed => DQ_0_2_rd, QYellow => DQ_0_1_ye, QGreen => DQ_0_0_gn);
    ;
END_PROGRAM