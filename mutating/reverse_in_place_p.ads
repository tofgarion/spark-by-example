with Types;         use Types;
with Swap_P;        use Swap_P;
with Is_Reversed_P; use Is_Reversed_P;

package Reverse_In_Place_P with
     Spark_Mode is

   procedure Reverse_In_Place (A : in out T_Arr) with
      Pre  => A'First > 0 and then A'Last > 0,
      Post => Is_Reversed (A, A'Old);

end Reverse_In_Place_P;
