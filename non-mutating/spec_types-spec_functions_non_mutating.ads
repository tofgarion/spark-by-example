-- This package only contains specification. It is to be used with
-- each function implementation

--generic
--  type T is private;
--  type T_Arr is array (Positive range <>) of T;
package Spec_Types.Spec_Functions_Non_Mutating with
  Spark_Mode,
  Ghost
is
   function Has_Value (A   : T_Arr;
                       Val : T) return Boolean is
     (for some I in A'Range => A (I) = Val);

   function Has_Value_Of (A : T_Arr;
                          B : T_Arr) return Boolean Is
     (for some I in A'Range => Has_Value(B, A(I)));

end Spec_Types.Spec_Functions_Non_Mutating;
