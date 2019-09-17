NAMESPACE stdLib.Timer
    CLASS ClockGenerator

    VAR PRIVATE
        m_timer1 : stdLib.Timer.OnDelay;
        m_timer2 : stdLib.Timer.OnDelay;
        m_isRunning : BOOL;
        m_q : BOOL;
    END_VAR

    METHOD PUBLIC Execute
        VAR_INPUT
            pulse : DINT;
            pause : DINT;
            sysLibTimer : DINT;
        END_VAR

            m_timer1.Execute(sysLibTimer);
            m_timer2.Execute(sysLibTimer);
            

            IF (m_timer2.Q() OR not(m_isRunning)) THEN
                m_timer1.Start(PT := pulse);
                m_timer2.Reset();
                m_isRunning := true;
                m_q := true;
            END_IF;

            if (m_timer1.Q() ) then 
                m_timer2.Start(PT:=pause);
                m_timer1.Reset();
                m_q := false;
            End_if;            
    END_METHOD
    
    METHOD PUBLIC Q : BOOL
        Q := m_q;         
    END_METHOD

    
    END_CLASS

END_NAMESPACE