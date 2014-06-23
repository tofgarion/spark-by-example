package body Chap4 is

   -----------------
   -- Max_Element --
   -----------------

   function Max_Element (A : T_Arr) return Positive is
      Result : Positive := A'First;
   begin
      for J in A'First .. A'Last loop
         if A (Result) < A (J) then
            Result := J;
         end if;
         pragma Loop_Invariant
           (Result in A'Range and
            (for all K in A'First .. J => A (K) <= A (Result)) and
            (for all K in A'First .. Result - 1 => A (K) < A (Result)));
      end loop;

      return Result;
   end Max_Element;

end Chap4;
