NAMESPACE StdLibTesting.AnalogSignal

    {Test}
    FUNCTION EnableDisableLimiter
        VAR_INPUT
        END_VAR
        VAR_TEMP
            o : stdLib.SignalHandling.AnalogSignal;
            status : stdLib.SignalHandling.AnalogSignalStatus;
        END_VAR
        
        // Enable Limiter
        status := o.execute(signal := 100.0, enable := true);
        Assert_Equal_BOOL(expected := false, actual := status.LimiterIsEnabled);
        o.EnableLimiter(-200.0, 200.0);
        status := o.execute(signal := 100.0, enable := true);                      
        Assert_Equal_BOOL(expected := true, actual := status.LimiterIsEnabled);
        
        //disable limiter
        o.DisableLimiter();
        status := o.execute(signal := 100.0, enable := true);                      
        Assert_Equal_BOOL(expected := false, actual := status.LimiterIsEnabled);

    END_FUNCTION

// In Range
 {Test(av := 199, ll := -200, hl := 200, expQ := 199, expMax := 0, expMin := 0)}
 {Test(av := -199, ll := -200, hl := 200, expQ := -199, expMax := 0, expMin := 0)}
// Max Limit
 {Test(av := 200, ll := -200, hl := 200, expQ := 200, expMax := 1, expMin := 0)}
 {Test(av := 201, ll := -200, hl := 200, expQ := 200, expMax := 1, expMin := 0)}
// Min Limit
 {Test(av := -200, ll := -200, hl := 200, expQ := -200, expMax := 0, expMin := 1)}
 {Test(av := -201, ll := -200, hl := 200, expQ := -200, expMax := 0, expMin := 1)}
 
 
    FUNCTION CheckLimiter
        VAR_INPUT
            av : INT; //actual value
            ll : INT; //Lower Limit
            hl : INT; // higher limit
            expQ : INT; //expected Q
            expMax : INT; //expected MaxLimitReached
            expMin : INT; //expected MinLimitReached
            
        END_VAR
        VAR_TEMP
            o : stdLib.SignalHandling.AnalogSignal;
            status : stdLib.SignalHandling.AnalogSignalStatus;
            tAv : LREAL;
            tLL : LREAL;
            tHL : LREAL;
            tExpQ : LREAL;
            tMax : BOOL;
            tMin : BOOL;
        END_VAR

        tAv := INT_TO_LREAL(av);
        tLL := INT_TO_LREAL(ll);
        tHL := INT_TO_LREAL(hl);
        tExpQ := INT_TO_LREAL(expQ);
        tMax := expMax <> 0;
        tMin := expMin <> 0;

        // Enable Limiter
        o.EnableLimiter(tLL, tHL);
                
        // Max Limit reached
        status := o.execute(signal := tAv, enable := true);
        Assert_Equal_BOOL(expected := tMax, actual := status.MaxLimitReached);
        Assert_Equal_BOOL(expected := tMin, actual := status.MinLimitReached);
        Assert_Equal_LREAL(expected := tExpQ, actual := status.Q);
    END_FUNCTION





END_NAMESPACE