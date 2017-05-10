-- This package only contains specification functions and needed
-- types. It is to be used with each function implementation

--generic
--  type T is private;
--  type T_Arr is array (Positive range <>) of T;
package Spec_Functions_Non_Mutating with
  SPARK_Mode
is

   type T is new Integer;
   type T_Arr is array (Positive Range <>) of T;


end Spec_Functions_Non_Mutating;
