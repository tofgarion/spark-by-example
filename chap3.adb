package body Chap3 with
     Spark_Mode is

   -----------
   -- Equal --
   -----------

   function Equal (A : T_Arr; B : T_Arr; Size : Natural) return Boolean is
   begin
      --  Note: here, we provide a full implementation of the equal
      --  operator in place of a simple array comparison

      for J in 0 .. Size - 1 loop
         if A (A'First + J) /= B (B'First + J) then
            return False;
         end if;

         pragma Loop_Invariant
           (for all K in 0 .. J => A (A'First + K) = B (B'First + K));
         pragma Loop_Variant
           (Increases => J);
      end loop;

      return True;
   end Equal;

   --------------
   -- Mismatch --
   --------------

   function Mismatch (A : T_Arr; B : T_Arr; Size : Natural) return Natural is
   begin
      for J in 0 .. Size - 1 loop
         if A (A'First + J) /= B (B'First + J) then
            return J;
         end if;

         pragma Loop_Invariant
           (for all K in 0 .. J => A (A'First + K) = B (B'First + K));
         pragma Loop_Variant
           (Increases => J);
      end loop;

      return Size;
   end Mismatch;

   ----------
   -- Find --
   ----------

   function Find (A : T_Arr; Size : Natural; Val : T) return Natural is
   begin
      for J in 0 .. Size - 1 loop
         if A (A'First + J) = Val then
            return J;
         end if;

         pragma Loop_Invariant
           (for all K in 0 .. J => A (A'First + K) /= Val);
         pragma Loop_Variant
           (Increases => J);
      end loop;

      return Size;
   end Find;

   --------------------
   --  Find_First_Of --
   --------------------

   function Find_First_Of
     (A      : T_Arr;
      Size_A : Natural;
      B      : T_Arr;
      Size_B : Natural) return Natural
   is
   begin
      for J in 0 .. Size_A - 1 loop
         if Find (B, Size_B, A (A'First + J)) < Size_B then
            return J;
         end if;

         pragma Loop_Invariant
           (not Has_Value_Of(A, J + 1, B, Size_B));
         pragma Loop_Variant
           (Increases => J);
      end loop;

      return Size_A;
   end Find_First_Of;

   -------------------
   -- Adjacent_Find --
   -------------------

   function Adjacent_First
     (A    : T_Arr;
      Size : Natural) return Natural
   is
   begin
      for J in 0 .. Size - 2 loop
         pragma Loop_Invariant
           (not Has_Equal_Neighbors(A, J + 1));
         pragma Loop_Variant
           (Increases => J);

         if A (A'First + J) = A (A'First + J + 1) then
            return J;
         end if;
      end loop;

      return Size;
   end Adjacent_First;

   ------------
   -- Search --
   ------------

   function Search
     (A      : T_Arr;
      Size_A : Natural;
      B      : T_Arr;
      Size_B : Natural) return Natural
   is
   begin
      for J in 0 .. Size_A - Size_B loop
         pragma Loop_Invariant
           (not Has_Sub_Range(A, Size_B + J - 1, B, Size_B));
         pragma Loop_Variant
           (Increases => J);

         if Equal(A (A'First + J .. A'Last), B, Size_B) then
           return J;
         end if;
      end loop;

      return Size_A;
   end Search;

end Chap3;
