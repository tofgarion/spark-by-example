with Types; use Types;
with Random_P; use Random_P;
with Multiset_Unchanged_P; use Multiset_Unchanged_P;
with Shuffle_Lemmas; use Shuffle_Lemmas;
with Swap_Array_P; use Swap_Array_P;

package Random_Shuffle_P with
  SPARK_Mode is
   
  procedure Random_Shuffle (A : in out T_Arr) with
     Post => Multiset_Unchanged(A'Old,A);
   
  
   
end Random_Shuffle_P;
