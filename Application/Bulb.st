NAMESPACE Application
    
    CLASS Bulb
        VAR
            m_switch : stdLib.SignalHandling.BinSignal;
        END_VAR

        METHOD Set
            VAR_INPUT
                signal : BOOL;                 
            END_VAR
            VAR_IN_OUT
                Q : stdLib.SignalHandling.BinOutput;
            END_VAR
            Q.setQ(value := signal);
        END_METHOD
        
        METHOD PUBLIC Toggle
            VAR_IN_OUT
                Q : stdLib.SignalHandling.BinOutput;
            END_VAR
                Q.Toggle();
                
        END_METHOD        
    END_CLASS

    

END_NAMESPACE