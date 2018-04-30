with Types; use Types;
with Sorted_P; use Sorted_P;
with Multiset_Predicates; use Multiset_Predicates;
with Swap_Array_P; use Swap_Array_P;

package Selection_Sort_P with
  SPARK_Mode
is
   
   procedure Selection_Sort(A : in out T_Arr) with
     Post => Is_Sorted(A)
     and then Multiset_Unchanged(A,A'Old);
   
end Selection_Sort_P;
