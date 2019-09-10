NAMESPACE stdLib.SignalHandling
    CLASS BinSignal
        
        VAR PRIVATE
            m_status : BinSignalStatus;
            m_Old : BOOL;
        END_VAR

        METHOD PUBLIC execute : BinSignalStatus
            VAR_INPUT
                signal : BOOL;
                enable : BOOL := TRUE;
                qDefault : BOOL := FALSE;
            END_VAR
            VAR_TEMP
                sig : BOOL;
            END_VAR
            IF (enable) THEN
                sig := signal;
                m_status.QBAD := FALSE;
            ELSE
                sig := qDefault;
                m_status.QBAD := TRUE;
            END_IF;

            m_Status.QRis := sig AND NOT(m_Old);
            m_Status.QFal := NOT(sig) AND m_Old;            
            m_Old := sig;
            m_status.Q := sig;
            

            execute := m_status;
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