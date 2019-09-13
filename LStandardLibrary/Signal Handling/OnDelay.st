NAMESPACE stdLib.Timer
    //##################################################################
    // Class: OnDelay
    //
    // Description: provides a on delay in OOP
    //##################################################################
    CLASS OnDelay
        VAR
            m_timeElapsed : DINT;
            m_status : Timerstatus;
            m_old : BOOL;
            m_isRunning : BOOL;
            m_PT : DINT;          
            m_timeOld : DINT;  
        END_VAR

        VAR PUBLIC 
        END_VAR

        
        //##################################################################
        // Method Reset
        // 
        // Reset a timer. Q will be reset to FALSE
        //##################################################################
        METHOD PUBLIC Reset
            m_isRunning := FALSE;
            m_status.Q := FALSE;
            m_status.ET := DINT#0;
            m_PT := DINT#0;            
        END_METHOD


        METHOD PUBLIC Start
            VAR_INPUT
                PT : DINT;
                Retrigger : BOOL := false;
            END_VAR
             
            IF (retrigger OR NOT(m_isRunning)) THEN
                m_PT := PT;
                m_status.ET := m_PT;
                m_status.Q := FALSE;
                m_isRunning := TRUE;
            END_IF;
        END_METHOD



        METHOD PUBLIC Execute : BOOL

            VAR_EXTERNAL
            END_VAR
            
            VAR_INPUT
                sysLibTimer : DINT;
            END_VAR
            VAR_TEMP               
                tTimeDifference : DINT;
            END_VAR


            tTimeDifference := ((sysLibTimer - m_timeOld) +  System.Const.MaxTimer()) MOD  System.Const.MaxTimer();
            m_timeOld := sysLibTimer;

            if (m_isRunning) then 
                m_status.ET := m_status.ET - tTimeDifference;
            end_if;

            if (m_status.ET <= DINT#0 AND m_isRunning) then 
                m_status.Q := true;
                m_isRunning := false;
            END_IF;      
            Execute := m_status.Q;          
        END_METHOD


        METHOD PUBLIC Q : BOOL
            Q := m_status.Q;                
        END_METHOD



        METHOD PUBLIC GetStatus : Timerstatus
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
            ET : DINT;
        END_STRUCT;
    END_TYPE

END_NAMESPACE