with Types;         use Types;
with Is_Replaced_P; use Is_Replaced_P;

package Replace_Copy_P with
     Spark_Mode is

   procedure Replace_Copy (A : T_Arr; B : in out T_Arr; V : T; W : T) with
      Pre  => A'Length = B'Length,
      Post => Is_Replaced (A, B, V, W);

end Replace_Copy_P;
