package body Pop_Heap_P with
     Spark_Mode is

   function Maximum_Heap_Child (H : Heap; P : Positive) return Option is
      Right, Left : Positive;  -- storage for the two childs.
   begin
      if P <= H.Size / 2 then
         Right := 2 * P + 1;
         Left  := Right - 1;
         if Right <= H.Size then
            return
              (Exists => True,
               Value  => (if H.A (Right) <= H.A (Left) then Left else Right));
         else
            return (Exists => True, Value => Left);
         end if;
      else
         return (Exists => False);
      end if;

   end Maximum_Heap_Child;

   procedure Pop_Heap (H : in out Heap) is
      V  : T := H.A (1);
      Hole  : Positive         := 1;
      Child  : Option;
      Interm : T_Arr (H.A'Range) :=
        H.A;  -- should be ghost, but there are some operations done with this variable
      A_Init : T_Arr (H.A'Range) := H.A with
         Ghost;  -- initial array backup
   begin
      if H.A (H.Size) <
        V
      then  --nothing to be done otherwise (H.A is "constant")
         Child := Maximum_Heap_Child (H, Hole);
         while Child.Exists
           and then Child.Value < H.Size
           and then H.A (H.Size) < H.A (Child.Value)
         loop

            Swap_Array
              (Interm,
               Hole,
               Child
                 .Value); -- permutation approach: preserves multiset but not heap structure

            H.A (Hole) :=
              H.A
                (Child
                   .Value);  -- moving "hole" approach: preserves heap structure but not multiset structure.

            Hole := Child.Value;
            Child := Maximum_Heap_Child (H, Hole);

         end loop;

         H.A (Hole) := H.A (H.Size);

         H.A (H.Size) := V;
         Swap_Array (Interm, Hole, H.Size);

	    else
      end if;

      H.Size := H.Size - 1;

   end Pop_Heap;
end Pop_Heap_P;
