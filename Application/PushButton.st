NAMESPACE Application
    
    CLASS PushButton
        VAR
            m_switch : stdLib.SignalHandling.BinSignal;
        END_VAR

        METHOD PUBLIC RefToSetSignal
            VAR_IN_OUT
                switch :  stdLib.SignalHandling.BinSignal;
            END_VAR
            m_switch := switch;

        END_METHOD

        METHOD PUBLIC clicked : BOOL
            VAR_INPUT
            END_VAR
            VAR_TEMP
            END_VAR
            clicked := m_switch.QRis();
                ;
        END_METHOD

        METHOD PUBLIC released : BOOL
            VAR_INPUT
            END_VAR
            VAR_TEMP
            END_VAR
            released := m_switch.QFal();
                ;
        END_METHOD

        METHOD PUBLIC isPressed : BOOL
            VAR_INPUT
            END_VAR
            VAR_TEMP
            END_VAR
            isPressed := m_switch.Q();
                ;
        END_METHOD

        METHOD PUBLIC isRelesed : BOOL
            VAR_INPUT
            END_VAR
            VAR_TEMP
            END_VAR
            isRelesed := NOT(m_switch.Q());
                ;
        END_METHOD

    END_CLASS

    

END_NAMESPACE