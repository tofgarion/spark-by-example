with Types; use Types;
with Swap_Array_P; use Swap_Array_P;
with Multiset_Unchanged_P; use Multiset_Unchanged_P;
with Occ_P; use Occ_P;


package Shuffle_Lemmas with
  SPARK_Mode, 
  Ghost is
   
   procedure Occ_Union
     (A : T_Arr;
      B : T_Arr;
      Concat : T_Arr;
      V : T) with 
     Pre =>A'Length + B'Length = Concat'Length 
     and then A'Last = B'First -1
     and then Concat = A & B,
     Post => Occ(Concat,V) = Occ(A,V) + Occ(B,V);
    
   
    procedure Swap_Multiset_Inv_Lemma
     (A : T_Arr;
      B : T_Arr;
      I : Positive;
      J : Positive) with
    Global => null,
      Pre => B'Length = A'Length
      and then A'Length >=1
      and then I in A'Range
      and then J in A'Range
      and then J <= I
      and then B = Swap_Array(A,I,J),
      Post => Multiset_Unchanged(A,B);
    
end Shuffle_Lemmas;
