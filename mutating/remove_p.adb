package body Remove_P with
     Spark_Mode is
   procedure Remove (A : in out T_Arr; Val : T; K : in out Natural) is
      F : Option := Find (A, Val);
      A_Save : T_Arr := A with Ghost;
   begin
      if A'Length > 0 then
         K := A'Last;
         if F.Exists then
            Remove_Copy
              (A (F.Value + 1 .. A'Last),
               A (F.Value .. A'Last - 1),
               Val,
               K);
            if F.Value > A'First then
               No_Changes (A_Save (A'First .. F.Value - 1), A_Save (A'First .. F.Value - 1), A (A'First .. F.Value - 1), Val);
            end if;

         --   pragma Assert(Multiset_Retain_Rest(A_Save,A(A'First .. K),Val));
         --   pragma Assert (for all J in F.Value .. K => A (J) /= Val);
         else
            Lemma_3 (A, Val);
         end if;
      end if;
   end Remove;
end Remove_P;
