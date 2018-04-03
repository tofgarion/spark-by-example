package body Pop_Heap_P with
  SPARK_Mode 
is
   
   
   function Maximum_Heap_Child(H : Heap; P : Positive) return Positive
   is
      Right, Left : Positive;
   begin
      if P <= H.Size/2 then
	 Right := 2*P+1;
	 Left := Right -1;
	 if Right <= H.Size then
	    return (if H.A(Right) <= H.A(Left) then Left else Right);
	 else
	       return Left;
	 end if;
      else
	 return H.Size+1;
      end if;
	 
   end Maximum_Heap_Child;

   procedure Pop_Heap(H : in out Heap) 
   is
      V : T := H.A(1);
      Hole : Positive := 1;
      Child : Positive;
      Interm : T_Arr(H.A'Range) with Ghost;
      Init : T_Arr(H.A'Range) := H.A with Ghost;
   begin
      if H.A(H.Size) < V then
	 pragma Assert(H.Size >=2);
	 Child := Maximum_Heap_Child(H,Hole);
	 
	 while Child < H.Size and then H.A(H.Size) < H.A(Child) loop
	    Interm := H.A; -- ghost
	    H.A(Hole) := H.A(Child);
	    pragma Assert(Is_Set(Interm,Hole,H.A(Child),H.A));
	    
	    for E in T loop
	       Occ_Set(Interm,H.A,Hole,H.A(Child),E);
	    end loop;
            --pragma Loop_Invariant(H.A'Length = Init'Length);
            pragma Loop_Invariant(H.Size >= 2);
            pragma Assert(Child < H.Size);
	    pragma Loop_Invariant(Hole in 1 .. H.Size-1);
	    pragma Loop_Invariant(Hole < Child);
	    pragma Loop_Invariant(Is_Heap_Def(H));
	    pragma Loop_Invariant(if Hole /=1 then H.A(H.Size) < H.A(Heap_Parent(Hole)));
	    pragma Loop_Invariant(if Child < H.Size then Hole = Heap_Parent(Child));
	    pragma Loop_Invariant(Heap_Maximum_Child(H,Hole,Child));
            pragma Assert(H.A'Last >= H.Size);
            pragma Assert(H.Size >=2);
	    pragma Loop_Invariant(Upper_Bound(H.A(1 .. H.Size),V));
	    pragma Loop_Variant(Decreases => H.Size-Hole);
	    Hole := Child;
	    pragma Assert(Child < H.Size);
	    pragma Assert(Hole < H.Size);
	    Child := Maximum_Heap_Child(H,Hole);
	    end loop;
         Interm := H.A;
         
	 H.A(Hole) := H.A(H.Size);
	 
	 pragma Assert(Is_Set(Interm,Hole,H.A(H.Size),H.A));
	    
	    for E in T loop
	       Occ_Set(Interm,H.A,Hole,H.A(H.Size),E);
	    end loop;
	    
	 Interm := H.A;
	 H.A(H.Size) := V;
	 
	 pragma Assert(Is_Set(Interm,H.Size,V,H.A));
	    
	    for E in T loop
	       Occ_Set(Interm,H.A,H.Size,V,E);
	       pragma Loop_Invariant(for all F in T'First .. E => Occ(H.A,F) = Occ(Init,F));
	    end loop;
	 
      end if;
      
      H.Size := H.Size-1;
      pragma Assert(H.A'Length >= H.Size+1);
      pragma Assert(Upper_Bound(H.A(1 .. H.Size+1),H.A(H.Size+1)));
      pragma Assert(Is_Heap_Def(H));
	 end Pop_Heap;
end Pop_Heap_P;
