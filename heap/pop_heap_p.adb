package body Pop_Heap_P with
  SPARK_Mode 
is
   
   
   function Maximum_Heap_Child(H : Heap; P : Positive) return Option
   is
      Right, Left : Positive;  -- storage for the two childs.
   begin
      if P <= H.Size/2 then
	 Right := 2*P+1;
	 Left := Right -1;
	 if Right <= H.Size then
	    return (Exists => True, Value =>(if H.A(Right) <= H.A(Left) then Left else Right));
	 else
	       return (Exists => True, Value =>Left);
	 end if;
      else
	 return (Exists => False);
      end if;
	 
   end Maximum_Heap_Child;

   procedure Pop_Heap(H : in out Heap) 
   is
--        V : T := H.A(1);
--        C1 : Positive;
--        Hole : Positive := 1;
--        Sizes : constant Integer := H.Size;
--        Child : Option;
--        Interm : T_Arr(H.A'Range) := H.A;  -- should be ghost, but there are a few opperations done this variables.
--        Init : T_Arr(H.A'Range) := H.A with Ghost; -- initial array
--        Save : Heap := H with Ghost;  -- intermediary ghost heap.
   begin
--        pragma assert(V = Init(1));
--        if H.A(H.Size) < V then  --nothing to be done otherwise (array is "constant")
--  	 pragma Assert(H.Size >=2);
--           Child := Maximum_Heap_Child(H,Hole);
--           if Child.Exists then
--              C1 := Child.Value;
--           else
--              C1 := H.Size+1;
--           end if;
--           
--           pragma Assert(Is_Heap_Def(H));
--           while Child.Exists and then Child.Value < H.Size and then  H.A(H.Size) < H.A(Child.Value) loop
--              
--              Save := H;
--              
--              pragma assert(Hole in Interm'Range and then Child.Value in Interm'Range); -- precondition checking
--              
--              Swap_Array(Interm,Hole,Child.Value); -- permutation approach : preserves multiset but not heap structure
--              
--              pragma assert(Is_Heap_Def(Save));
--              pragma assert(H.A(Hole) >= H.A(Child.Value));
--              
--              H.A(Hole) := H.A(Child.Value);  -- moving "hole" approcach : preserves heap structure but not multiset structure.
--              
--              pragma assert(Child.Exists);
--              pragma assert(C1<=H.Size);
--              pragma assert(C1 >= 2 and then 1 = Heap_Parent(C1));
--              pragma assert(H.A(1) = Init(C1));
--              pragma Assert(Is_Set(Save.A,Hole,Save.A(Child.Value),H.A));
--              Heap_Set(Save,H,Hole,Child.Value); -- guide to automatic solvers, helps them keep track of the modifications.
--              
--              pragma Assert(H.Size >=2);
--              pragma Assert(Child.Value in H.A'Range);
--              pragma assert(V >= H.A(1));
--              Upper_Bound_Heap(H,V);   -- guide to upper_bound verification
--              pragma assert(H.Size <= H.A'Last);
--              
--              pragma Loop_Invariant(H.A(1) = H'Loop_Entry.A(C1));
--              pragma Loop_Invariant(Child.Exists);
--              pragma Loop_Invariant(Child.Value < H.Size);
--              pragma Loop_Invariant(H.Size = H'Loop_Entry.Size);
--  	    pragma Loop_Invariant(Hole in 1 .. H.Size-1);
--  	    pragma Loop_Invariant(Hole < Child.Value);
--  	    pragma Loop_Invariant(if Hole /=1 then H.A(H.Size) < H.A(Heap_Parent(Hole)));
--              pragma Loop_Invariant(if Child.Value < H.Size then Hole = Heap_Parent(Child.Value));
--              pragma Loop_Invariant(Heap_Maximum_Child(H,Hole,Child.Value));
--              pragma Loop_Invariant(H.Size in H.A'Range);
--              pragma Loop_Invariant(Upper_Bound(H.A(1 .. Sizes),V));
--              pragma Loop_Invariant(Multiset_Unchanged(Init,Interm));
--              pragma Loop_Invariant(Is_Set(H.A,Child.Value,V,Interm));
--              pragma Loop_Invariant(Is_Heap_Def(H));
--              pragma Loop_Invariant(H.A(Hole) > H.A(H.Size));
--              pragma Loop_Variant(Decreases => H.Size-Hole);
--              
--  	    Hole := Child.Value;
--  	    pragma Assert(Hole < H.Size);
--              Child := Maximum_Heap_Child(H,Hole);
--              
--           end loop;
--           
--           Save := H;
--           pragma assert(if Child.Exists and then Child.value <H.Size then H.A(H.Size) >= H.A(Child.Value));  -- checks to helps to prove the conservation of heap structure
--           pragma assert(Is_Heap_Def(H));
--           pragma assert(if Child.Exists and then Child.Value < H.Size and then Hole /=1 then Heap_Maximum_Child(H,Hole,Child.Value) and then H.A(H.Size) < H.A(Heap_Parent(Hole)));
--           
--           
--           H.A(Hole) := H.A(H.Size);
--           
--           
--           pragma assert(Is_Set(Save.A,Hole,Save.A(H.Size),H.A));  -- checks to help prove heap structure.
--           if Child.Exists and then Child.Value = H.Size then 
--              Heap_Set(Save,H,Hole,H.Size);
--           elsif Child.Exists and then Child.Value < H.Size then
--              null;
--           end if;
--           
--           pragma assert(Is_Heap_Def(h));
--           
--           H.A(H.Size) := V;
--           Swap_Array(Interm,Hole,H.Size);
--  	 
--        else 
--           pragma assert(H.A(H.Size) = H.A(1));  -- if nothing was done we verify that the last element and first element of the heap are equal (should be since the array is constant)
--        end if;
--        
--        pragma Assert(Interm = H.A);  -- verify that swap approach and hole approcach give same result
--        for V in T loop
--           Occ_Eq(Interm,H.A,V);
--           pragma Loop_Invariant(for all F in T'First .. V => Occ(Interm,F) = Occ(H.A,F));  --verify that Interm and H.A represent same the same set of values
--        end loop;
--        pragma Assert(Multiset_Unchanged(Interm,H.A));
--        pragma Assert(Multiset_Unchanged(Init, H.A));
--        
--        pragma assert(V = H.A(H.Size));
--        H.Size := H.Size-1;
--        pragma assert(V = H.A(H.Size +1));
--        
--        pragma Assert(H.A'Length >= H.Size+1);
--        if H.Size >=1 then
--           Upper_Bound_Heap(H,H.A(H.Size+1));
--        end if;
--        
--        pragma Assert(Upper_Bound(H.A(1 .. H.Size+1),H.A(H.Size+1)));
      null;
	 end Pop_Heap;
end Pop_Heap_P;
