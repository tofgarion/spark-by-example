with Types;               use Types;
with Push_Heap_P;         use Push_Heap_P;
with Swap_Array_P;        use Swap_Array_P;
with Pop_Heap_P;          use Pop_Heap_P;
with Sort_Heap_P;         use Sort_Heap_P;
with Make_Heap_P;         use Make_Heap_P;
with Multiset_Predicates; use Multiset_Predicates;
with Upper_Bound_P;       use Upper_Bound_P;
with Lower_Bound_P;       use Lower_Bound_P;
with Heap_Predicates;     use Heap_Predicates;
with Partition_P;         use Partition_P;
with Sorted_P;            use Sorted_P;
with Heap_Lemmas;         use Heap_Lemmas;
with Sorting_Lemmas;      use Sorting_Lemmas;
with Occ_P;               use Occ_P;
with Has_Value_P;         use Has_Value_P;
with Is_Sorted_P;         use Is_Sorted_P;
with Occ_Def_P;           use Occ_Def_P;
with Classic_Lemmas; use Classic_Lemmas;

package Partial_Sort_P with
     Spark_Mode is

   procedure Partial_Sort_Aux (H : in out Heap; M : Positive) with
      Pre => H.Size > 0
      and then M in 1 .. H.Size
      and then H.Size <= MAX_SIZE
      and then (if M > 1 then Is_Heap_Def ((A => H.A, Size => M - 1))),
      Post => Sorted (H.A (1 .. M - 1))
      and then Partition (H.A, M, H.Size)
      and then Multiset_Unchanged (H.A'Old, H.A)
      and then H.Size = H'Old.Size
      and then
      (if
         H.Size < MAX_SIZE
       then
         H'Old.A (H.Size + 1 .. MAX_SIZE) = H.A (H.Size + 1 .. MAX_SIZE));

   procedure Partial_Sort (A : in out T_Arr; M : Positive) with
      Pre  => M in A'First + 1 .. A'Last and then A'Length < MAX_SIZE,
      Post => Multiset_Unchanged (A'Old, A)
      and then Is_Sorted (A (A'First .. M - 1))
      and then Partition (A, M, A'Last);

end Partial_Sort_P;
