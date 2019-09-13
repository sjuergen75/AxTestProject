NAMESPACE stdLib.SignalHandling
    CLASS BinSignal
        
        VAR PRIVATE
            m_status : BinSignalStatus;
            m_Old : BOOL;
        END_VAR

        METHOD PUBLIC set : BinSignalStatus
            VAR_INPUT
                signal : BOOL;
                valid : BOOL := TRUE;
                default : BOOL := FALSE;
            END_VAR
            VAR_TEMP
                sig : BOOL;
            END_VAR
            IF (valid) THEN
                sig := signal;
                m_status.QBAD := FALSE;
            ELSE
                sig := default;
                m_status.QBAD := TRUE;
            END_IF;

            m_Status.QRis := sig AND NOT(m_Old);
            m_Status.QFal := NOT(sig) AND m_Old;            

            m_Old := sig;
            m_status.Q := sig;

            set := m_status;
        END_METHOD
        
        METHOD PUBLIC Q : BOOL
            Q := m_status.Q;
        END_METHOD

        METHOD PUBLIC QRis : BOOL
            QRis := m_status.QRis;            
        END_METHOD

        METHOD PUBLIC QFal : BOOL
            QFal := m_status.QFal;
        END_METHOD

        METHOD PUBLIC QBad : BOOL
            QBad := m_status.QBad;
        END_METHOD

        METHOD GetStatus : BinSignalStatus
            GetStatus := m_status;
        END_METHOD

    END_CLASS

    TYPE BinSignalStatus : STRUCT
            Q : BOOL;
            QRis : BOOL;
            QFal : BOOL;
            QBad : BOOL;
        END_STRUCT;
    END_TYPE

END_NAMESPACE