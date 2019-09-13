NAMESPACE StdLibTesting.Encoder

    {Test}
    FUNCTION Start_Q
        VAR_INPUT
        END_VAR
        VAR_TEMP
            o : stdLib.Timer.OnDelay;
            status : stdLib.Timer.TimerStatus;
        END_VAR
       
        o.Start(PT := DINT#5000);        
        Assert_Equal_BOOL(expected := false, actual := o.Q());
        Assert_Equal_DINT(expected := DINT#5000, actual := o.GetStatus().ET);
    END_FUNCTION

    {Test}
    FUNCTION Start_Q_retrigger
        VAR_INPUT
        END_VAR
        VAR_TEMP
            o : stdLib.Timer.OnDelay;
            status : stdLib.Timer.TimerStatus;
        END_VAR
       
        o.Start(PT := DINT#5000, retrigger := true);        
        Assert_Equal_BOOL(expected := false, actual := o.Q());
        Assert_Equal_DINT(expected := DINT#5000, actual := o.GetStatus().ET);
    END_FUNCTION
    
        {Test}
    FUNCTION Start_Q_TwoStarts
        VAR_INPUT
        END_VAR
        VAR_TEMP
            o : stdLib.Timer.OnDelay;
            status : stdLib.Timer.TimerStatus;
        END_VAR
       
        o.Start(PT := DINT#5000);        
        Assert_Equal_BOOL(expected := false, actual := o.Q());
        Assert_Equal_DINT(expected := DINT#5000, actual := o.GetStatus().ET);
        o.Start(PT := DINT#9000);        
        Assert_Equal_BOOL(expected := false, actual := o.Q());
        Assert_Equal_DINT(expected := DINT#5000, actual := o.GetStatus().ET);
    END_FUNCTION

    {Test}
    FUNCTION Start_Q_TwoStartsRetrig
        VAR_INPUT
        END_VAR
        VAR_TEMP
            o : stdLib.Timer.OnDelay;
            status : stdLib.Timer.TimerStatus;
        END_VAR
       
        o.Start(PT := DINT#5000);        
        Assert_Equal_BOOL(expected := false, actual := o.Q());
        Assert_Equal_DINT(expected := DINT#5000, actual := o.GetStatus().ET);
        o.Start(PT := DINT#9000, retrigger := true);        
        Assert_Equal_BOOL(expected := false, actual := o.Q());
        Assert_Equal_DINT(expected := DINT#9000, actual := o.GetStatus().ET);
    END_FUNCTION
END_NAMESPACE