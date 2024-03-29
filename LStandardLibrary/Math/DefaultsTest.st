NAMESPACE System.Math.Test

    {Test}
    FUNCTION Constants
        VAR_INPUT
        END_VAR
        VAR_TEMP
        END_VAR
        
        Assert_Equal_LREAL(expected := 3.1415926535897932384626433832795, actual := System.Const.PI());
        Assert_Equal_INT(expected := 32767, actual := System.Const.MaxInt());
        Assert_Equal_INT(expected := -32768, actual := System.Const.MinInt());
        
        Assert_Equal_DINT(expected := DINT#2147483647, actual := System.Const.MaxDInt());
        Assert_Equal_DINT(expected := DINT#-2147483647, actual := System.Const.MinDInt());
        
    END_FUNCTION

END_NAMESPACE