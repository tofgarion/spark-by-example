package body Remove_Copy_Lemmas with
   Spark_Mode
 is

   procedure Unique_Value
     (A   : T_Arr;
      E   : T;
      Val : T)
   is
   begin
      if A'Length = 0 then
         return;
      end if;
      Unique_Value (Remove_Last (A), E, Val);
   end Unique_Value;

   procedure Make_Prove_Multiset
     (A   : T_Arr;
      B   : T_Arr;
      Val : T)
   is
   begin
      for E in T loop
         if E /= Val and then B'Length = 1 then
            Unique_Value (Remove_Last (A), E, Val);
         end if;

         pragma Loop_Invariant
           (for all F in T'First .. E =>
              (if F /= Val then Occ (A, F) = Occ (B, F)));
      end loop;

   end Make_Prove_Multiset;

   procedure Multiset_Retain_Rest_Equal
     (A   : T_Arr;
      B   : T_Arr;
      C   : T_Arr;
      Val : T)
   is
   begin
      for E in T loop
         if E /= Val then
            Occ_Equal (B, C, E);
            pragma Assert (Occ (A, E) = Occ (C, E));
         end if;
         pragma Loop_Invariant
           (for all F in T'First .. E =>
              (if F /= Val then Occ (A, F) = Occ (C, F)));
      end loop;
   end Multiset_Retain_Rest_Equal;

end Remove_Copy_Lemmas;
