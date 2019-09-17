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
        //o.Evaluate(tA, tB);
        status := o.GetStatus();

        Assert_Equal_BOOL(expected := tDir, actual := status.direction);
        Assert_Equal_DINT(expected := INT_TO_DINT(pos), actual := status.position);
        Assert_Equal_DINT(expected := INT_TO_DINT(pos), actual := status.increments);

        status := o.GetStatus();
        Assert_Equal_DINT(expected := INT_TO_DINT(pos), actual := status.position);
        Assert_Equal_DINT(expected := DINT#0, actual := status.increments);
        ;
    END_FUNCTION

//################################################################################
//
//################################################################################
    {Test( a_t0 := 0, b_t0 := 0, a_t1 := 0, b_t1 := 0, dir := 0, pos := 0)}
    {Test( a_t0 := 0, b_t0 := 0, a_t1 := 1, b_t1 := 0, dir := 0, pos := 1)}
    {Test( a_t0 := 1, b_t0 := 0, a_t1 := 1, b_t1 := 0, dir := 0, pos := 0)}
    {Test( a_t0 := 1, b_t0 := 0, a_t1 := 1, b_t1 := 1, dir := 0, pos := 1)}
    {Test( a_t0 := 1, b_t0 := 1, a_t1 := 1, b_t1 := 1, dir := 0, pos := 0)}
    {Test( a_t0 := 1, b_t0 := 1, a_t1 := 0, b_t1 := 1, dir := 0, pos := 1)}
    {Test( a_t0 := 0, b_t0 := 1, a_t1 := 0, b_t1 := 1, dir := 0, pos := 0)}
    {Test( a_t0 := 0, b_t0 := 1, a_t1 := 0, b_t1 := 0, dir := 0, pos := 1)}
    
    
    {Test( a_t0 := 0, b_t0 := 0, a_t1 := 0, b_t1 := 1, dir := 1, pos := -1)}
    {Test( a_t0 := 0, b_t0 := 1, a_t1 := 1, b_t1 := 1, dir := 1, pos := -1)}
    {Test( a_t0 := 1, b_t0 := 1, a_t1 := 1, b_t1 := 0, dir := 1, pos := -1)}
    {Test( a_t0 := 1, b_t0 := 0, a_t1 := 0, b_t1 := 0, dir := 1, pos := -1)}
 
    FUNCTION EncoderDirection_new
        VAR_INPUT
            a_t1 : INT;
            b_t1 : INT;
            a_t0 : INT;
            b_t0 : INT;
            dir : INT;
            pos : INT;
        END_VAR
        VAR
            tA_t1 : BOOL;
            tB_t1 : BOOL;
            tA_t0 : BOOL;
            tB_t0 : BOOL;
            tDir : BOOL;
            o : stdLib.SignalHandling.Encoder;
            status : stdLib.SignalHandling.EncoderStatus;
        END_VAR
        tA_t1 := a_t1 <> 0;
        tB_t1 := b_t1 <> 0;
        tA_t0 := a_t0 <> 0;
        tB_t0 := b_t0 <> 0;
        tDir := dir <> 0;        
        //o.Evaluate(tA_t0, tB_t0);
        //o.Evaluate(tA_t1, tB_t1);
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