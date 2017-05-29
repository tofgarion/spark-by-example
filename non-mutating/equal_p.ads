-- specification of Equal

with Types; use Types;
with Equal_Ranges_P; use Equal_Ranges_P;

package Equal_P with
     Spark_Mode is

   function Equal (A : T_Arr; B : T_Arr) return Boolean with
      Pre  => A'Length <= B'Length,
      Post => Equal'Result = Equal_Ranges (A, B);
end Equal_P;
