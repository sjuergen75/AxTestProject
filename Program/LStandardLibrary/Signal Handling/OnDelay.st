NAMESPACE stdLib.Timer
    CLASS OnDelay
        VAR
            m_timeElapsed : INT;
            m_status : Timerstatus;
            m_old : BOOL;
            m_isRunning : BOOL;
            m_PT : INT;
        END_VAR

        METHOD Start
            VAR_INPUT
                PT : INT;
                Retrigger : BOOL := false;
            END_VAR
            VAR_TEMP
            END_VAR                
                if (retrigger OR NOT(m_isRunning)) THEN
                    m_PT := PT;
                    m_status.ET := m_PT;
                    m_isRunning := true;
                END_IF;
        END_METHOD

        METHOD Execute : BOOL
            VAR_INPUT
            END_VAR
            VAR_TEMP
                tQ : BOOL;
            END_VAR
        
            if (m_status.ET > m_PT) then 
                m_status.ET := m_status.ET - 1;
            end_if;

            if (m_status.ET <= m_PT) then 
                tQ := true;
                m_isRunning := false;
            ELSE
                tQ := false;
            END_IF;      
            m_status.Q := tQ;
            Execute := tQ;          
        END_METHOD


        METHOD Q : BOOL
            VAR_INPUT
            END_VAR
            VAR_TEMP
            END_VAR
            Q := m_status.Q;
                ;
        END_METHOD



        METHOD GetStatus : Timerstatus
            VAR_INPUT
            END_VAR
            VAR_TEMP
            END_VAR
                GetStatus := m_status;
                ;
        END_METHOD

    END_CLASS

    TYPE Timerstatus : 
        STRUCT
            Q : BOOL;
            ET : INT;
        END_STRUCT;
    END_TYPE

END_NAMESPACE