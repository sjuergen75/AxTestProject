NAMESPACE StdLibTesting.Encoder

    {Test}
    FUNCTION Reset
        VAR_INPUT
        END_VAR
        VAR_TEMP
            o : stdLib.SignalHandling.Encoder;
            status : stdLib.SignalHandling.EncoderStatus;
        END_VAR
       
        o.Set(DINT#555);
        status := o.GetStatus();
        Assert_Equal_DINT(expected := DINT#555, actual := status.position);
        o.Reset();        
        status := o.GetStatus();
        Assert_Equal_DINT(expected := DINT#0, actual := status.position);
        Assert_Equal_DINT(expected := DINT#0, actual := status.increments);
        ;
            ;
    END_FUNCTION

    {Test( aOld := 0, a := 0, bOld := 0, b := 0, dir := 0, pos := 0)}
    {Test( aOld := 1, a := 1, bOld := 1, b := 1, dir := 0, pos := 0)}
    
    {Test( aOld := 0, a := 1, bOld := 0, b := 0, dir := 0, pos := 1)}
    {Test( aOld := 1, a := 0, bOld := 1, b := 1, dir := 0, pos := 1)}
    {Test( aOld := 1, a := 1, bOld := 0, b := 1, dir := 0, pos := 1)}
    {Test( aOld := 0, a := 0, bOld := 1, b := 0, dir := 0, pos := 1)}

    
    {Test(a := 1, b := 1, aOld := 0, bOld := 1, dir := 1, pos := -1)}
    {Test(a := 0, b := 1, aOld := 0, bOld := 0, dir := 1, pos := -1)}
    {Test(a := 0, b := 0, aOld := 1, bOld := 0, dir := 1, pos := -1)}
    {Test(a := 1, b := 0, aOld := 1, bOld := 1, dir := 1, pos := -1)}
    
    FUNCTION EncoderDirection
        VAR_INPUT
            a : INT;
            b : INT;
            aOld : INT;
            bOld : INT;
            dir : INT;
            pos : INT;
        END_VAR
        VAR
            tA : BOOL;
            tB : BOOL;
            tAOld : BOOL;
            tBOld : BOOL;
            tDir : BOOL;
            o : stdLib.SignalHandling.Encoder;
            status : stdLib.SignalHandling.EncoderStatus;
        END_VAR
        tA := a <> 0;
        tB := b <> 0;
        tAOld := aOld <> 0;
        tBold := bOld <> 0;
        tDir := dir <> 0;
        o.SetInternals(aOld := tAOld, bOld:= tBold);
        o.Evaluate(tA, tB);
        status := o.GetStatus();

        Assert_Equal_BOOL(expected := tDir, actual := status.direction);
        Assert_Equal_DINT(expected := INT_TO_DINT(pos), actual := status.position);
        Assert_Equal_DINT(expected := INT_TO_DINT(pos), actual := status.increments);

        status := o.GetStatus();
        Assert_Equal_DINT(expected := INT_TO_DINT(pos), actual := status.position);
        Assert_Equal_DINT(expected := DINT#0, actual := status.increments);
        ;
    END_FUNCTION
END_NAMESPACE