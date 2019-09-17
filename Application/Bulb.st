NAMESPACE Application
    
    CLASS Bulb
        VAR            
        END_VAR

        METHOD PUBLIC Set
            VAR_INPUT
                value : BOOL;                 
            END_VAR
            VAR_IN_OUT
                Q : stdLib.SignalHandling.BinOutput;
            END_VAR
            Q.setQ(value := value);
        END_METHOD
        
        METHOD PUBLIC Toggle
            VAR_IN_OUT
                Q : stdLib.SignalHandling.BinOutput;
            END_VAR
                Q.Toggle();
                
        END_METHOD        
    END_CLASS

    

END_NAMESPACE