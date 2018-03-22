with Types; use Types;
with Swap_Array_P; use Swap_Array_P;
with Multiset_Unchanged_P; use Multiset_Unchanged_P;

package Shuffle_Lemmas with
  SPARK_Mode, 
  Ghost is
   
    procedure Swap_Multiset_Inv_Lemma
     (A : T_Arr;
      B : T_Arr;
      I : Positive;
      J : Positive) with
    Global => null,
      Pre => B'Length = A'Length
      and then I in A'Range
      and then J in A'Range
      and then B = Swap_Array(A,I,J),
      Post => Multiset_Unchanged(A,B);
    
    procedure Multiset_Transitivity_Lemma
      (A : T_Arr;
       B : T_Arr;
       C : T_Arr) with
      Pre => A'Length = B'Length
      and then B'Length = C'Length
      and then Multiset_Unchanged(A,B)
      and then Multiset_Unchanged(B,C),
      Post => Multiset_Unchanged(A,C);
      
end Shuffle_Lemmas;
