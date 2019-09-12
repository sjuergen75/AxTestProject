
PROGRAM Timer
    VAR_TEMP
    END_VAR
    VAR_EXTERNAL
        sysLibTimer : DINT;
    END_VAR;

    sysLibTimer := (sysLibTimer + DINT#10) MOD System.Const.MaxTimer(); // increment by 10ms --> must be match with the task configuration "interval := 10ms";

END_PROGRAM