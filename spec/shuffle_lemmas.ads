with Types; use Types;
with Multiset_Unchanged_P; use Multiset_Unchanged_P;
with Occ_P; use Occ_P;
with Occ_Def_P; use Occ_Def_P;

------------------------------------------------
-- The specification and implementation of these functions is largely inspired
-- from the SPARK 2014 user guide:
-- https://docs.adacore.com/spark2014-docs/html/ug/gnatprove_by_example/manual_proof.html


package Shuffle_Lemmas with
  SPARK_Mode, 
  Ghost is
   
   function Is_Set(A : T_Arr; I : Positive; V : T; B : T_Arr) return Boolean 
   is
     (A'First = B'First and then A'Last = B'Last
      and then B(I) = V
      and then (for all J in A'Range =>
                    (if i /= J then B(J) = A(J)))) with
   Pre => I in A'Range;
   
   procedure Occ_Set (A : T_Arr; B : T_Arr; I : Positive; V ,E : T) with
     Pre => I in A'Range and then Is_Set(A,I,V,B),
     Post =>
       (if V = A(I) then Occ(B,E) = Occ(A,E)
              elsif V = E then Occ(B,E) = Occ(A,E) + 1
              elsif A(I) = E then Occ(B,E) = Occ(A,E) - 1
              else Occ(B,E)=Occ(A,E));
    
end Shuffle_Lemmas;
