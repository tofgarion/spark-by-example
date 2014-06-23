package body Chap5
  with SPARK_Mode
is


   -----------------
   -- Lower_Bound --
   -----------------

   function Lower_Bound (A : T_Arr; Val : T) return Index_T is
      Left   : Index;
      Right  : Index;
      Middle : Index;

   begin
      Left   := A'First;
      Right  := A'Last;
      Middle := (Left + Right) / 2;

      if A (Left) > Val or else A (Right) < Val then
         return 0;
      end if;

      while Left < Right loop
         pragma Loop_Invariant
           ((Left >= A'First) and
            (Left <= Right) and
            (Right <= A'Last) and
            (for all Index in A'First .. Left - 1 => A (Index) <= Val) and
            (for all Index in Right .. A'Last => Val <= A (Index)));

         pragma Loop_Variant (Decreases => Right - Left);

         Middle := Left + (Right - Left) / 2;

         if A (Middle) < Val then
            pragma Assert (for all J in A'First .. Middle => A (J) < Val);
            Left := Middle + 1;
         elsif A (Middle) > Val then
            Right := Middle;
         else
            return Middle;
         end if;
      end loop;

      return 0;
   end Lower_Bound;

end Chap5;
