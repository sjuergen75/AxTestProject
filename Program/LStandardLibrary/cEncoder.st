NAMESPACE stdLib.SignalHandling
    CLASS Encoder
        VAR PRIVATE
            m_aOld : BOOL;
            m_bOld : BOOL;
            m_status : EncoderStatus;
        END_VAR

        // Reset encoder position to zero
        METHOD Reset
            m_status.position := DINT#0;
        END_METHOD

        //Set encoder to specific position
        METHOD Set
            VAR_INPUT
                position : DINT;
            END_VAR
                m_Status.position := position;
                ;
        END_METHOD

        //Evaluate encoder signals A and B
        METHOD PUBLIC evaluate
            VAR_INPUT
                a : BOOL;
                b : BOOL;
            END_VAR
            VAR_TEMP
                aRis : BOOL;
                bRis : BOOL;
                aFal : BOOL;
                bFal : BOOL;
            END_VAR

            aRis := a AND NOT(m_aOld);
            aFal := NOT(a) AND m_aOld;
            m_aOld := a;

            bRis := b AND NOT(m_bOld);
            bFal := NOT(b) AND m_bOld;
            m_bOld := b;

            //Forward detection
            IF (
                aRis AND NOT(b)
                OR a AND bRis
                OR aFal AND b
                OR NOT(a) AND bFal) THEN   
                m_status.isInMotion := true;
                m_status.direction := false;
                m_status.position := m_status.position + DINT#1; 
                m_status.increments := m_status.increments + DINT#1;
            //Reverse detection
            ELSIF 
            (
                aRis AND b
                OR NOT(a) AND bRis
                OR aFal AND NOT(b)
                OR a AND bFal) THEN   
                m_status.isInMotion := true;
                m_status.direction := true;
                m_status.position := m_status.position - DINT#1; 
                m_status.increments := m_status.increments - DINT#1;
            ELSE
                m_status.isInMotion := false;
                m_status.direction := false;
            END_IF;

        END_METHOD

        METHOD PUBLIC GetStatus : EncoderStatus
            ;
            GetStatus := m_status;
            m_status.increments := DINT#0;
        END_METHOD
    END_CLASS

    

    TYPE EncoderStatus :
        STRUCT
            position : DINT;  // increments since last reset
            increments : DINT; // increments since last GetStatus-Call
            direction : BOOL; // 0: forward; 1: reverse
            isInMotion : BOOL; // encoder is in motion
        END_STRUCT;
    END_TYPE
END_NAMESPACE


NAMESPACE StdLibTesting
    {Test(a := 1, b := 0, aOld := 0, bOld := 0, dir := 0, pos := DINT#1)}
    {Test(a := 1, b := 1, aOld := 1, bOld := 0, dir := 0, pos := DINT#1)}
    {Test(a := 0, b := 1, aOld := 1, bOld := 1, dir := 0, pos := DINT#1)}
    {Test(a := 0, b := 0, aOld := 0, bOld := 1, dir := 0, pos := DINT#1)}
    
    {Test(a := 1, b := 1, aOld := 0, bOld := 1, dir := 1, pos := DINT#-1)}
    {Test(a := 0, b := 1, aOld := 0, bOld := 0, dir := 1, pos := DINT#-1)}
    {Test(a := 0, b := 0, aOld := 1, bOld := 0, dir := 1, pos := DINT#-1)}
    {Test(a := 1, b := 0, aOld := 1, bOld := 1, dir := 1, pos := DINT#-1)}
    
    FUNCTION EncoderDirection
        VAR_INPUT
            a : INT;
            b : INT;
            aOld : INT;
            bOld : INT;
            dir : INT;
            pos : DINT;
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
        o.Evaluate(tAOld, tBOld);
        o.Evaluate(tA, tB);
        status := o.GetStatus();

        Assert_Equal_BOOL(expected := tDir, actual := status.direction);
        Assert_Equal_DINT(expected := pos, actual := status.position);
        Assert_Equal_DINT(expected := pos, actual := status.increments);

        status := o.GetStatus();
        Assert_Equal_DINT(expected := pos, actual := status.position);
        Assert_Equal_DINT(expected := DINT#0, actual := status.increments);
        ;
    END_FUNCTION
END_NAMESPACE