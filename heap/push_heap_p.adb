package body Push_Heap_P with
     Spark_Mode is
   procedure Push_Heap (H : in out Heap) is
      V      : T := H.A (H.Size);
      Hole   : Natural;
      Parent : Natural;
      Old_V  : T with
         Ghost;
      Old_A : T_Arr := H.A with
         Ghost;
   begin
      if 1 < H.Size then
         Hole := Heap_Parent (H.Size);
         if H.A (Hole) < V then

            H.A (H.Size) := H.A (Hole);
	    
            if 0 < Hole then
               Parent := Heap_Parent (Hole);
               while Hole > 0 and then H.A (Parent) < V loop
                --  Old_V := H.A(Hole);
                  if H.A (Hole) < H.A (Parent) then
                     H.A (Hole) := H.A (Parent);
                  end if;
                  Hole := Parent;
                  if (0 < Hole) then
                     Parent := Heap_Parent (Hole);
                  end if;
		  
	          pragma Loop_Invariant(Hole in 1 .. H. Size);
		  pragma Loop_Invariant(Is_Heap(H));
		  pragma Loop_Invariant(Parent = Heap_Parent(Hole));
		  pragma Loop_Invariant(H.A(Hole) < V);
               end loop;

            end if;
            H.A (Hole) := V;
         end if;
      end if;

   end Push_Heap;
end Push_Heap_P;
