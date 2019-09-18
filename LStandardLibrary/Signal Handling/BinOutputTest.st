NAMESPACE StdLibTesting.BinOutput

    //-----------------------------------------------------------
    // test SetQ(value)
    //-----------------------------------------------------------
    {Test(value := 0, expect := 0)}
    {Test(value := 1, expect := 1)}
    FUNCTION TestSetQ
        VAR_INPUT
            value : INT;
            expect : INT;
        END_VAR
            
        VAR_TEMP
            o : stdLib.SignalHandling.BinOutput;
            tValue : BOOL;
            tExp : BOOL;
            tActual : BOOL;
        END_VAR
        
        tValue := value <> 0;
        tExp := expect <> 0;
        
        o.SetQ(value := tValue);
        Assert_Equal_BOOL(expected := tExp, actual := o.IsOn());
    END_FUNCTION

    //-----------------------------------------------------------
    // test SetOn
    //-----------------------------------------------------------
    {Test}
    FUNCTION SetOn
        VAR_TEMP
            o : stdLib.SignalHandling.BinOutput;
        END_VAR        

        Assert_Equal_BOOL(expected := false, actual := o.IsOn());
        o.SetOn();
        Assert_Equal_BOOL(expected := true, actual := o.IsOn());
    END_FUNCTION

    //-----------------------------------------------------------
    // test SetOff
    //-----------------------------------------------------------
    {Test}
    FUNCTION SetOff    

        VAR_TEMP
            o : stdLib.SignalHandling.BinOutput;
        END_VAR
        
        o.SetOn();
        Assert_Equal_BOOL(expected := true, actual := o.IsOn());
        o.SetOff();
        Assert_Equal_BOOL(expected := false, actual := o.IsOn());
    END_FUNCTION
   
    //-----------------------------------------------------------
    // test SetOff
    //-----------------------------------------------------------
    {Test}
    FUNCTION Toggle

        VAR_TEMP
            o : stdLib.SignalHandling.BinOutput;
        END_VAR
                
        Assert_Equal_BOOL(expected := false, actual := o.IsOn());
        o.Toggle();
        Assert_Equal_BOOL(expected := true, actual := o.IsOn());
        o.Toggle();
        Assert_Equal_BOOL(expected := false, actual := o.IsOn());
    END_FUNCTION   

END_NAMESPACE