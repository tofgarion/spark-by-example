with Types;               use Types;
with Sorted_P;            use Sorted_P;
with Multiset_Predicates; use Multiset_Predicates;
with Swap_Array_P;        use Swap_Array_P;
with Min_Element_P;       use Min_Element_P;
with Lower_Bound_P;       use Lower_Bound_P;

package Selection_Sort_P with
     Spark_Mode is

   procedure Selection_Sort (A : in out T_Arr) with
      Post => Sorted (A) and then Multiset_Unchanged (A, A'Old);

end Selection_Sort_P;
