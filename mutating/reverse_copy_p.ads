with Types;         use Types;
with Is_Reversed_P; use Is_Reversed_P;

package Reverse_Copy_P with
     Spark_Mode is

   procedure Reverse_Copy (A : T_Arr; B : in out T_Arr) with
      Pre  => A'Length = B'Length,
      Post => Is_Reversed (A, B);

end Reverse_Copy_P;
