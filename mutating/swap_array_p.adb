package body Swap_Array_P with
  SPARK_Mode is
   
    function Swap_Array(A : T_Arr; I : Positive; J : Positive)return T_Arr is
      Result : T_Arr (A'Range) :=A;
      Temp : T := Result(I);
      
      --ghost variables
      
      Interm : T_Arr (A'Range) with Ghost;
      
      -- ghost procedure
      
      procedure Prove_Perm with Ghost,
        Pre => I in A'Range and then J in A'Range
        and then Is_Set(A,I,A(J),Interm)
        and then Is_Set(Interm,J,A(I),Result),
        Post => Multiset_Unchanged(A,Result)
      is
      begin
         for V in T loop
            Occ_Set(A,Interm,I,A(J),V);
            Occ_Set(Interm,Result,J,A(I),V);
            pragma Loop_Invariant
              (for all F in T'First .. V =>
                 Occ(Result,F) = Occ(A,F));
         end loop;
      end Prove_Perm;
      
   begin
      Result(I) := Result(J);
      Interm := Result;
      
      pragma Assert(Is_Set(A,I,A(J),Result));

      Result(J) := Temp;
      
      pragma Assert(Is_Set(Interm,J,A(I),Result));
      Prove_Perm;
      return Result;
   end Swap_Array;
end Swap_Array_P;
