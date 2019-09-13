NAMESPACE stdLib.SignalHandling
    CLASS BinOutput
        
        VAR
            m_State : BOOL;
        END_VAR
        
        METHOD PUBLIC RefToOutput
            VAR_OUTPUT
                Q : BOOL;
            END_VAR
            Q:= m_state;
        END_METHOD

        METHOD PUBLIC SetQ
            VAR_INPUT
                value : BOOL;
            END_VAR
            m_State := value;
        END_METHOD

        METHOD PUBLIC SetOn
            m_State := TRUE;
        END_METHOD
        
        METHOD PUBLIC SetOff
            m_State := FALSE;
        END_METHOD
        
        METHOD PUBLIC Toggle
            m_state := NOT(m_state);
        END_METHOD

        METHOD PUBLIC IsOn : BOOL
            IsOn := m_state;
        END_METHOD

    END_CLASS
END_NAMESPACE