NAMESPACE Application
    
    CLASS Bulb
        VAR
            m_State : BOOL;            
        END_VAR

        METHOD PUBLIC Set
            VAR_INPUT
                value : BOOL;                 
            END_VAR
            VAR_IN_OUT
                Q : stdLib.SignalHandling.BinOutput;
            END_VAR
            
            Q.SetQ(value := value);
            m_State := Q.IsOn();
        END_METHOD
        
        METHOD PUBLIC Toggle
            VAR_IN_OUT
                Q : stdLib.SignalHandling.BinOutput;
            END_VAR
                Q.Toggle();
                m_State := Q.IsOn();
        END_METHOD        
    END_CLASS

    

END_NAMESPACE