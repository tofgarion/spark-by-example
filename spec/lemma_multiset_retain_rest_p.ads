with Types;                  use Types;
with Multiset_Retain_Rest_P; use Multiset_Retain_Rest_P;
with Count_P;                use Count_P;

package Lemma_Multiset_Retain_Rest_P with
     Spark_Mode,
     Ghost is
   procedure Lemma_1 (A : T_Arr; B : T_Arr; Val : T) with
      Pre => A'Length > 0
      and then B'Length > 0
    --  and then A'Length >= B'Length
      and then
      ((B'Length = 1
        and then (for all J in A'First .. A'Last - 1 => A (J) = Val)
        and then A (A'Last) = B (B'Last))
       or else
       (B'Length > 1
        and then Multiset_Retain_Rest
          (A (A'First .. A'Last - 1),
           B (B'First .. B'Last - 1),
           Val)
        and then A (A'Last) = B (B'Last))),

      Post => Multiset_Retain_Rest (A, B, Val);

   procedure Lemma_2 (A : T_Arr; B : T_Arr; Val : T) with
      Pre => A'Length > 0
      and then
      ((A'Length = 1 and then A (A'First) = Val)
       or else
       (A'Length > 1
        and then Multiset_Retain_Rest (A (A'First .. A'Last - 1), B, Val)
        and then A (A'Last) = Val)),
      Post => Multiset_Retain_Rest (A, B, Val);
end Lemma_Multiset_Retain_Rest_P;
