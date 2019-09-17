NAMESPACE stdLib.SignalHandling
    CLASS Encoder
        VAR PRIVATE
            m_aOld : BOOL;
            m_bOld : BOOL;
            m_status : EncoderStatus;
        END_VAR

        // Reset encoder position to zero
        METHOD PUBLIC Reset
            m_status.position := DINT#0;
        END_METHOD

        //Set encoder to specific position
        METHOD PUBLIC Set
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
                aOOP : stdLib.SignalHandling.BinSignal;
                bOOP : stdLib.SignalHandling.BinSignal;
            END_VAR
            VAR_TEMP
                aRis : BOOL;
                bRis : BOOL;
                aFal : BOOL;
                bFal : BOOL;
            END_VAR

            IF (
                aOOP.QRis() AND NOT(bOOP.Q())
                OR aOOP.Q() AND bOOP.QRis()
                OR aOOP.QFal() AND bOOP.Q()
                OR NOT(aOOP.Q()) AND bOOP.qFal())
                 THEN   
                m_status.isInMotion := true;
                m_status.direction := false;
                m_status.position := m_status.position + DINT#1; 
                m_status.increments := m_status.increments + DINT#1; 
            //Reverse detection
            ELSIF 
                
                (
                aOOP.QRis() AND bOOP.Q()
                OR NOT(aOOP.Q()) AND bOOP.QRis()
                OR aOOP.QFal() AND NOT(bOOP.Q())
                OR aOOP.Q() AND bOOP.qFal()) THEN
 
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

        METHOD PUBLIC SetInternals
            VAR_INPUT
                aOld : BOOL;
                bOld : BOOL; 
            END_VAR
            m_aOld := aOld;
            m_bOld := bOld;
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


