-- The Has_Value function is used to specify that a value occurs in an
-- array.

with Types; use Types;

package Has_Value_P with
     Spark_Mode,
     Ghost is
   function Has_Value
     (A   : T_Arr;
      Val : T) return Boolean is
     (for some I in A'Range => A (I) = Val);

end Has_Value_P;
