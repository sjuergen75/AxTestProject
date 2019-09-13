NAMESPACE Application
    
    CLASS Motor
        VAR
            m_Output : stdLib.SignalHandling.BinOutput;
        END_VAR

        METHOD PUBLIC RefToSetSignal
            VAR_IN_OUT
                Q :  stdLib.SignalHandling.BinOutput;
            END_VAR
            m_Output := Q;

        END_METHOD

        METHOD PUBLIC Start
            m_Output.SetQ(true);                        
        END_METHOD

        METHOD PUBLIC Stop
            m_Output.SetQ(true);                        
        END_METHOD

        

    END_CLASS

    

END_NAMESPACE