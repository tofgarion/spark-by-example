package body Heap_Lemmas with
SPARK_Mode
is

   procedure Heap_Set( H1 : Heap; H2 : Heap; P : Positive; C : Positive)
   is
   begin
      if H1.Size = 0 then
         return;
      end if;
      --pragma assert(False);
      null;
      --pragma assert(for all K in 1 .. H1.Size => (if K /=P then H1.A(K) = H2.A(K)));
      --pragma assert(for all K in 2 .. H2.Size => (if Heap_Parent(K) /= P then H2.A(K) <= H2.A(Heap_Parent(K))));
      --pragma assert(H2.A(P) >= H2.A(C));
   end;


   procedure Upper_Bound_Heap(H : Heap; V : T)
   is
   begin
      null;
   end;

end Heap_Lemmas;
