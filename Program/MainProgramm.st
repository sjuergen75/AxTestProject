// Basic configuration, check documentation: https://dev.axcite.me/docs/st-language/programming.html#configuration
CONFIGURATION PLC_1

    var_global
        a : int := 0;
        b : int;
        c : INT;       
        xAr : array[1..4] of int;
        // declare my motors

        //Motor 1
        motor1On AT %Q0.0 : BOOL;
        myMotor1 : stdLib.Motion.Axis;

        myMotor1Status : stdLib.Motion.tAxisStatus;
        posM1 : DINT;
        
        // Motor 2
        motor2On AT %Q0.1 : BOOL;
        myMotor2 : stdLib.Motion.Axis;
        myMotor2Status : stdLib.Motion.tAxisStatus;
        posM2 : DINT;
    end_var

    TASK Main(Interval := T#1000ms, Priority := 1);

    


    PROGRAM P1 WITH Main : MyBernd;
    PROGRAM P2 WITH Main : MyBernd;
END_CONFIGURATION

PROGRAM MyBernd /* name of the program */

    VAR_EXTERNAL
        a : Int;
        b : int;
        motor1On : bool;   
        motor2On : bool;   
        
        myMotor1 : stdLib.Motion.Axis;
        myMotor2 : stdLib.Motion.Axis;

        c : INT;
    


        myMotor1Status : stdLib.Motion.tAxisStatus;
        myMotor2Status : stdLib.Motion.tAxisStatus;
        posM1 : DINT;
        posM2 : DINT;

    END_VAR (*end of variable declaration*)
    VAR_TEMP

    END_VAR
    
    VAR 
       myVarInProgramm : INT;
       //myMotor2 : cAxis;
       
    end_var


    //myMotor1Status := myMotor1.GetStatus();
    //myMotor2Status := myMotor2.Homing();
    if (myMotor1.Homing().done) then 
        ;
    ELSIF (myMotor1.Homing().error) then 
    ;
    end_if;

    posM1 := myMotor1.GetPos();
    posM2 := myMotor2.GetPos();
    IF true THEN
        ;
    ELSIF true THEN
        ;
    ELSE
        ;
    END_IF;

    c := c + 1;
    myVarInProgramm := myVarInProgramm + 1;
END_PROGRAM