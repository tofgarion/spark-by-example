with Types;               use Types;
with Is_Heap_P;           use Is_Heap_P;
with Multiset_Predicates; use Multiset_Predicates;
with Heap_Predicates;     use Heap_Predicates;
with Push_Heap_Lemmas;    use Push_Heap_Lemmas;
--with Occ_P; use Occ_P;

package Push_Heap_P with
     Spark_Mode is
   procedure Push_Heap (H : in out Heap) with
      Pre => H.Size in 1 .. MAX_SIZE
      and then Is_Heap_Def ((A => H.A, Size => H.Size - 1)),
      Post => Is_Heap_Def (H)
     and then Multiset_Unchanged (H'Old.A, H.A)
   --  and then Multiset_Unchanged (H'Old.A (1 .. H.Size), H.A (1 .. H.Size))
       and then (if H.Size < MAX_SIZE then H'Old.A (H.Size + 1 .. MAX_SIZE) = H.A( H.Size + 1 .. MAX_SIZE))
     and then H.Size = H'Old.Size
--     and then (for some K in 1 .. H.Size => H.A (1) = H'Old.A (K))
   ;

end Push_Heap_P;
