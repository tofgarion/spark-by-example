package body Shuffle_Lemmas with
   Spark_Mode
 is

   procedure Occ_Eq
     (A : T_Arr;
      B : T_Arr;
      E : T)
   is
   begin
      if A'Length = 0 then
         return;
      end if;

      if A (A'Last) = E then
         pragma Assert (B (B'Last) = E);
      else
         pragma Assert (B (B'Last) /= E);
      end if;

      Occ_Eq (Remove_Last (A), Remove_Last (B), E);
   end Occ_Eq;

   procedure Occ_Set
     (A    : T_Arr;
      B    : T_Arr;
      I    : Positive;
      V, E : T)
   is
      Tmp : T_Arr := Remove_Last (A);
   begin
      if A'Length = 0 then
         return;
      end if;

      if I = A'Last then
         Occ_Eq (Tmp, Remove_Last (B), E);
      else
         Tmp (I) := V;
         Occ_Eq (Remove_Last (B), Tmp, E);
         Occ_Set (Remove_Last (A), Tmp, I, V, E);
      end if;
   end Occ_Set;

end Shuffle_Lemmas;
