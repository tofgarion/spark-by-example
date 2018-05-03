with Types;                   use Types;
with Has_Constant_Subrange_P; use Has_Constant_Subrange_P;

package Fill_P with
     Spark_Mode is
   procedure Fill (A : in out T_Arr; Val : T) with
      Pre  => A'Length > 0,
      Post => Constant_Range_From_Location (A, Val, A'First, A'Length);

end Fill_P;
