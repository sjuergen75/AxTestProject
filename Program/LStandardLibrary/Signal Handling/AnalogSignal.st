NAMESPACE stdLib.SignalHandling
    CLASS AnalogSignal
        
        VAR PRIVATE
            m_status : AnalogSignalStatus;
            m_Old : BOOL;            
            m_minValue : LREAL;
            m_maxValue : LREAL;
        END_VAR

        //##################################################################
        // Method EnableLimiter
        // 
        // Enables limitation for analog signal. If limitation enabled,
        // the status bits "MinLimitReached" and "MaxLimitReached" will be
        // set, if the signal exceeds the limits. 
        //
        // min : minimal limitation
        // max : max limitation 
        //##################################################################
        METHOD PUBLIC EnableLimiter
            VAR_INPUT
                min : LREAL;
                max : LREAL;
            END_VAR
            m_minValue := min;
            m_maxValue := max;             
            m_Status.LimiterIsEnabled := TRUE; 
        END_METHOD

        //##################################################################
        // Method DisableLimiter
        // 
        // Disables limitation for analog signal. If limitation disabled,
        // the status bits "MinLimitReached" and "MaxLimitReached" will not
        // set, if the signal exceeds the limits. 
        //##################################################################
        METHOD PUBLIC DisableLimiter
            m_Status.LimiterIsEnabled := FALSE;    
        END_METHOD


        //##################################################################
        // Method execute
        // 
        // Executes the signal evaluation
        //
        // Parameter:
        // signal : The analog signal to be evaluated
        // enable : Enables the signal evaluation
        // qDefault : Default value, if enable = false
        // Norm : Nomalize factor for signal
        //##################################################################
        METHOD PUBLIC execute : AnalogSignalStatus
            VAR_INPUT
                signal : LREAL;
                enable : BOOL := TRUE;
                qDefault : LREAL := 0.0;
                Norm : LREAL := LREAL#1.0;
            END_VAR
            VAR_TEMP
                actValue : LREAL;
            END_VAR
            IF (enable) THEN
                actValue := signal;
                m_status.QBAD := FALSE;
            ELSE
                actValue := qDefault;
                m_status.QBAD := TRUE;
            END_IF;
            
            // Check Limits if enabled
            IF (m_Status.LimiterIsEnabled) THEN
                m_status.MaxLimitReached := (actValue >= m_maxValue);
                m_status.MinLimitReached := (actValue <= m_minValue);
            ELSE
                m_status.MaxLimitReached := FALSE;
                m_status.MinLimitReached := FALSE;
            END_IF;

            IF (m_status.MaxLimitReached) THEN
                m_status.Q := m_maxValue;
            ELSIF (m_status.MinLimitReached) THEN
                m_status.Q := m_minValue;
            ELSE
                m_status.Q := actValue;
            END_IF;

            execute := m_status;

        END_METHOD
        
    END_CLASS


    TYPE AnalogSignalStatus : STRUCT
            Q : LREAL;
            QBad : BOOL;
            MaxLimitReached : BOOL;
            MinLimitReached : BOOL;
            LimiterIsEnabled : BOOL := FALSE;
        END_STRUCT;
    END_TYPE

END_NAMESPACE