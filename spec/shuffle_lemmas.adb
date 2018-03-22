package body Shuffle_Lemmas with
  SPARK_Mode is
   
   procedure Swap_Multiset_Inv_Lemma
     (A : T_Arr;
      B : T_Arr;
      I : Positive;
      J : Positive) is
   begin
      pragma Assume(Multiset_Unchanged(A,B));
   end Swap_Multiset_Inv_Lemma;
   
    procedure Multiset_Transitivity_Lemma
      (A : T_Arr;
       B : T_Arr;
       C : T_Arr) is
    begin
       pragma Assume(Multiset_Unchanged(A,C));
    end Multiset_Transitivity_Lemma;
    
   
end Shuffle_Lemmas;
