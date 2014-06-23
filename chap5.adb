package body Chap5 with
     Spark_Mode is

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

      if A (Left) > Val or else A (Right) < Val then
         return 0;
      end if;

      while Left < Right loop
         pragma Loop_Invariant
           ((Left >= A'First) and
            (Left <= Right + 1) and --  XXX differs from ACSL-by-Example
            (Right <= A'Last) and
            (for all J in A'Range => (if J < Left then A (J) < Val)) and
            (for all J in Right .. A'Last => Val <= A (J)));

         pragma Loop_Variant (Decreases => Right - Left);

         Middle := Left + (Right - Left) / 2;
         if A (Middle) < Val then
            pragma Assert (for all J in A'First .. Middle => A (J) < Val);
            Left := Middle + 1;
         else
            Right := Middle;
         end if;
      end loop;

      return Left;
   end Lower_Bound;

end Chap5;
