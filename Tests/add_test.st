
{Test(a:=1,b:=2,res:=3)}
{Test(a:=5,b:=3,res:=8)}
{Test(a:=7,b:=2,res:=9)}
{Test(a:=9,b:=2,res:=11)}
FUNCTION add_test
var_temp
    ergebnis:int;
end_var
    VAR_INPUT
        a:int;
        b:int;
        res:int;
    end_var

    ergebnis := add2(a, b);
    Assert_Equal_INT(expected:=res, actual:=ergebnis);
END_FUNCTION

