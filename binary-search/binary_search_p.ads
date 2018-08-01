with Types;                use Types;
with Sorted_P;             use Sorted_P;
with Has_Value_P;          use Has_Value_P;
with Search_Lower_Bound_P; use Search_Lower_Bound_P;

package Binary_Search_P with
   Spark_Mode
 is
   function Binary_Search
     (A   : T_Arr;
      Val : T)
      return Boolean with
      Pre  => Sorted (A) and then A'Last < Positive'Last,
      Post => Binary_Search'Result = Has_Value (A, Val);

end Binary_Search_P;
