package body Chap3 is

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

      end loop;

      return True;
   end Equal;

   --------------
   -- Mismatch --
   --------------

   function Mismatch (A : T_Arr; B : T_Arr; Size : Positive) return Natural is
   begin
      for J in 0 .. Size - 1 loop
         if A (A'First + J) /= B (B'First + J) then
            return J;
         end if;
         pragma Loop_Invariant
           (for all K in 0 .. J => A (A'First + K) = B (B'First + K));
      end loop;

      return Size;
   end Mismatch;

   ----------
   -- Find --
   ----------

   function Find (A : T_Arr; Size : Positive; Val : T) return Natural is
   begin
      for J in 0 .. Size - 1 loop
         if A (A'First + J) = Val then
            return J;
         end if;
         pragma Loop_Invariant (for all K in 0 .. J => A (A'First + K) /= Val);
      end loop;

      return Size;
   end Find;

end Chap3;
