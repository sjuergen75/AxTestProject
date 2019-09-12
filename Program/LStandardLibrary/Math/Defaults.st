NAMESPACE System

    NAMESPACE Const
    
        FUNCTION PI : LReal    
                PI := 3.1415926535897932384626433832795;
        END_FUNCTION

        FUNCTION MaxInt : INT    
                MaxInt := 32767;
        END_FUNCTION
        
        FUNCTION MinInt : INT    
                MinInt := -32768;
        END_FUNCTION

        FUNCTION MaxDInt : DINT    
                MaxDInt := DINT#2147483647;
        END_FUNCTION
        
        FUNCTION MinDInt : DINT    
                MinDInt := DINT#-2147483647;
        END_FUNCTION

        FUNCTION MaxTimer : DINT
            MaxTimer := DINT#10000000;
        END_FUNCTION

    END_NAMESPACE
    
END_NAMESPACE