with Types;          use Types;
with Equal_Ranges_P; use Equal_Ranges_P;

package Copy_P with
   Spark_Mode
 is

   procedure Copy
     (A :        T_Arr;
      B : in out T_Arr) with
      Pre  => A'Length = B'Length,
      Post => B = A;

end Copy_P;
