NAMESPACE StdLibTesting.BinSignal

    {Test(iSignal := 0, iEnable := 0, iDefault := 0, iExpQ := 0, iExpQBad := 1)}
    {Test(iSignal := 0, iEnable := 0, iDefault := 1, iExpQ := 1, iExpQBad := 1)}
    {Test(iSignal := 0, iEnable := 1, iDefault := 0, iExpQ := 0, iExpQBad := 0)}
    {Test(iSignal := 0, iEnable := 1, iDefault := 1, iExpQ := 0, iExpQBad := 0)}

    {Test(iSignal := 1, iEnable := 0, iDefault := 0, iExpQ := 0, iExpQBad := 1)}
    {Test(iSignal := 1, iEnable := 0, iDefault := 1, iExpQ := 1, iExpQBad := 1)}
    {Test(iSignal := 1, iEnable := 1, iDefault := 0, iExpQ := 1, iExpQBad := 0)}
    {Test(iSignal := 1, iEnable := 1, iDefault := 1, iExpQ := 1, iExpQBad := 0)}

    FUNCTION execute
        VAR_INPUT
            iSignal : INT;
            iEnable : INT;
            iDefault : INT;
            iExpQ : INT;
            iExpQBad : INT;
        END_VAR
            
        VAR_TEMP
            o : stdLib.SignalHandling.BinSignal;
            status : stdLib.SignalHandling.BinSignalStatus;
            tSignal : BOOL;
            tEnable : BOOL;
            tDefault : BOOL;
            tExpQ : BOOL;
            tExpQBad : BOOL;
        END_VAR
        
        tSignal := iSignal <> 0;
        tEnable := iEnable <> 0;
        tDefault := iDefault <> 0;
        tExpQ := iExpQ <> 0;
        tExpQBad := iExpQBad <> 0;
        
        status := o.set(signal := tSignal, valid := tEnable, default := tDefault);
        Assert_Equal_BOOL(expected := tExpQ, actual := status.Q);
        ;
            ;
    END_FUNCTION


    {Test(iSignal := 1, iEnable := 1, iDefault := 0, iExpQ := 1, iExpQRis := 1, iExpQFal := 0, iTestFallingEdge := 0)}
    {Test(iSignal := 0, iEnable := 1, iDefault := 0, iExpQ := 0, iExpQRis := 0, iExpQFal := 1, iTestFallingEdge := 1)}
    
    FUNCTION QRis
        VAR_INPUT
            iSignal : INT;
            iEnable : INT;
            iDefault : INT;
            iExpQ : INT;
            iExpQRis : INT;
            iExpQFal : INT;
            iTestFallingEdge : INT;
        END_VAR
        VAR_TEMP
            o : stdLib.SignalHandling.BinSignal;
            status : stdLib.SignalHandling.BinSignalStatus;
            tSignal : BOOL;
            tEnable : BOOL;
            tDefault : BOOL;
            tExpQ : BOOL;
            tExpQRis : BOOL;
            tExpQFal : BOOL;
            tTestFallingEdge : BOOL;
        END_VAR

        tSignal := iSignal <> 0;
        tEnable := iEnable <> 0;
        tDefault := iDefault <> 0;
        tExpQ := iExpQ <> 0;
        tExpQRis := iExpQRis <> 0;
        tExpQFal := iExpQFal <> 0;
        tTestFallingEdge := iTestFallingEdge <> 0;

    
        if (tTestFallingEdge) then 
            status := o.set(signal := true, valid := tEnable, default := tDefault); 
        END_IF;

        status := o.set(signal := tSignal, valid := tEnable, default := tDefault);
        Assert_Equal_BOOL(expected := tExpQ, actual := status.Q);
        Assert_Equal_BOOL(expected := tExpQRis, actual := status.QRis);
        Assert_Equal_BOOL(expected := tExpQFal, actual := status.QFal);
        
        status := o.set(signal := tSignal, valid := tEnable, default := tDefault);
        Assert_Equal_BOOL(expected := tExpQ, actual := status.Q);
        Assert_Equal_BOOL(expected := false, actual := status.QRis);
        Assert_Equal_BOOL(expected := false, actual := status.QFal);
    END_FUNCTION
END_NAMESPACE