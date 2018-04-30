with Types; use Types;
with Push_Heap_P; use Push_Heap_P;
with Swap_Array_P; use Swap_Array_P;
with Pop_Heap_P; use Pop_Heap_P;
with Sort_Heap_P; use Sort_Heap_P;
with Multiset_Predicates; use Multiset_Predicates;
with Upper_Bound_P; use Upper_Bound_P;
with Lower_Bound_P; use Lower_Bound_P;
with Heap_Predicates; use Heap_Predicates;
with Partition_P; use Partition_P;
with Sorted_P; use Sorted_P;
with Heap_Lemmas; use Heap_Lemmas;
with Sorting_Lemmas; use Sorting_Lemmas;
with Occ_P; use Occ_P;


package Partial_Sort_P with
SPARK_Mode
is

   procedure Partial_Sort (H : in out Heap; M : Positive) with
     Pre => H.Size > 0 and then
       M in 1 .. H.Size
       and then H.Size <= MAX_SIZE
       and then (if M > 1 then Is_Heap_Def ((A => H.A, Size => M - 1))),
     Post => Sorted ( H.A (1 .. M - 1) )
     and then Partition (H.A(1 .. H.Size), M)
     and then Multiset_Unchanged (H.A'Old, H.A)
   and then H.Size = H'Old.Size;

end Partial_Sort_P;
