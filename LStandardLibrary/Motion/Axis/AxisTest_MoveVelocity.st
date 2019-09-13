//{Test(fault:=false, resBusy:=true, resErr:=false)}
//{Test(fault:=true, resBusy:=false, resErr:=true)}
{Test}
FUNCTION moveVelocityRunOk
    VAR_INPUT
       fault : BOOL;
       resBusy : BOOL;
       resErr : BOOL;
    END_VAR
    VAR_TEMP
        res2 : BOOL;
        axis : stdLib.Motion.Axis;
        status : stdLib.Motion.enStatus;
        //boFault : BOOL;
    END_VAR
    
    //boFault := fault <> 0;

    axis.faultActive := false;
    res2 := axis.MoveVelocity();
    status := axis.GetStatus();

    Assert_Equal_BOOL(expected:=true, actual:=status.busy);
    Assert_Equal_BOOL(expected:=false, actual:=status.error);
    Assert_Equal_BOOL(expected:=false, actual:=status.done);

END_FUNCTION

{Test}
FUNCTION moveVelocityRunFalse
    VAR_TEMP
        res : BOOL;
        axis : stdLib.Motion.Axis;
        status : stdLib.Motion.enStatus;
    END_VAR
    
    axis.faultActive := true;
    res := axis.MoveVelocity();
    status := axis.GetStatus();
    
    Assert_Equal_BOOL(expected:=false, actual:=status.busy);
    Assert_Equal_BOOL(expected:=true, actual:=status.error);
    Assert_Equal_BOOL(expected:=false, actual:=status.done);

END_FUNCTION