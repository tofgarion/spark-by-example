with Types; use Types;
with Multiset_Unchanged_P; use Multiset_Unchanged_P;
with Shuffle_Lemmas; use Shuffle_Lemmas;
with Occ_P; use Occ_P;

package Swap_Array_P with
  SPARK_Mode is
   
    procedure Swap_Array(A : in out T_Arr; I : Positive; J : Positive) with
      Pre => A'Length >= 1 and then I in A'Range and then J in A'Range and then I >= J,
      Post =>A'Old(I) = A(J) 
      and then A'Old(J) = A(I)
     and then (for all K in A'Old'Range => (if I/=K and then J /= K then A'Old(K) = A(K)))
     and then Multiset_Unchanged(A'Old,A);
    
end Swap_Array_P;
