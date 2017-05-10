-- a simple package to hold all needed types

package Spec_Types Is
   type T is new Integer;
   type T_Arr is array (Positive range <>) of T;

   type Option is record
     Exists : Boolean;
     Value  : Positive;
   end record;
end Spec_Types;
