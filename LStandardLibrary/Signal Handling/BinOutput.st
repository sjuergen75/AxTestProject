NAMESPACE stdLib.SignalHandling
    //################################################################
    // Class BinOutput
    // An OOP concept to handle digital outputs as a own object
    //################################################################
    CLASS BinOutput        
        VAR
            m_State : BOOL;  // internal status 
        END_VAR
        
        //----------------------------------------------------------------
        // Write the internal state to the digital output 
        // (must be executed in every cycle - recommendation end of cycle)
        //----------------------------------------------------------------
        METHOD PUBLIC RefToOutput
            VAR_OUTPUT
                Q : BOOL;
            END_VAR            
            Q:= m_state;
        END_METHOD

        //-------------------------------------------------
        // Set the digital output to "value"
        //-------------------------------------------------
        METHOD PUBLIC SetQ
            VAR_INPUT
                value : BOOL;
            END_VAR
            m_State := value;
        END_METHOD

        //-------------------------------------------------
        // Set the digital output to "true"
        //-------------------------------------------------
        METHOD PUBLIC SetOn
            m_State := TRUE;
        END_METHOD
        
        //-------------------------------------------------
        // Set the digital output to "off"
        //-------------------------------------------------
        METHOD PUBLIC SetOff
            m_State := FALSE;
        END_METHOD
        
        //-------------------------------------------------
        // Toggle the digital output to off-->on-->off
        //-------------------------------------------------
        METHOD PUBLIC Toggle
            m_state := NOT(m_state);
        END_METHOD

        //---------------------------------------
        // Returns status of digital output
        //---------------------------------------
        METHOD PUBLIC IsOn : BOOL
            IsOn := m_state;
        END_METHOD

    END_CLASS
END_NAMESPACE