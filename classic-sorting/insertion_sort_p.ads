with Types; use Types;
with Sorted_P; use Sorted_P;
with Multiset_Predicates; use Multiset_Predicates;
with Search_Upper_Bound_P; use Search_Upper_Bound_P;
with Swap_Array_P; use Swap_Array_P;
with Upper_Bound_P; use Upper_Bound_P;
with Lower_Bound_P; use Lower_Bound_P;

package Insertion_Sort_P with
  SPARK_Mode
is
   
   procedure Insertion_Sort(A : in out T_Arr) with
     Pre => A'Last < Positive'Last,
     Post => Sorted(A) 
     and then Multiset_Unchanged(A,A'old);
   
end Insertion_Sort_P;
