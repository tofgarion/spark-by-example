-- The Has_Value_Of function is used to specify that an array contains
-- at least a value contained in another array

with Types;       use Types;
with Has_Value_P; use Has_Value_P;

package Has_Value_Of_P with
   Spark_Mode,
   Ghost
 is
   function Has_Value_Of
     (A : T_Arr;
      B : T_Arr)
      return Boolean is (for some I in A'Range => Has_Value (B, A (I)));

end Has_Value_Of_P;
