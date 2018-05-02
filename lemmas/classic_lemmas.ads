with Types; use Types;
with Multiset_Predicates; use Multiset_Predicates;
with Occ_Def_P; use Occ_Def_P;
with Occ_P; use Occ_P;
with Has_Value_P; use Has_Value_P;

package Classic_Lemmas with
SPARK_Mode
is

      procedure Occ_Eq (A : T_Arr; B : T_Arr; E : T) with
      Ghost,
      Pre  => A = B,
     Post => Occ (A, E) = Occ (B, E);

   function Is_Set
     (A : T_Arr;
      I : Positive;
      V : T;
      B : T_Arr) return Boolean is
     (A'First = B'First
      and then A'Last = B'Last
      and then B (I) = V
      and then (for all J in A'Range => (if I /= J then B (J) = A (J)))) with
      Ghost,
      Pre => I in A'Range;

   procedure Occ_Set (A : T_Arr; B : T_Arr; I : Positive; V, E : T) with
      Ghost,
      Pre  => I in A'Range and then Is_Set (A, I, V, B),
      Post =>
      (if V = A (I) then Occ (B, E) = Occ (A, E)
       elsif V = E then Occ (B, E) = Occ (A, E) + 1
       elsif A (I) = E then Occ (B, E) = Occ (A, E) - 1
             else Occ (B, E) = Occ (A, E));

end Classic_Lemmas;
