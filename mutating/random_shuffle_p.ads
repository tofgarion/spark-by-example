with Types;               use Types;
with Random_P;            use Random_P;
with Multiset_Predicates; use Multiset_Predicates;
with Classic_Lemmas;      use Classic_Lemmas;
with Swap_Array_P;        use Swap_Array_P;

package Random_Shuffle_P with
   Spark_Mode
 is

   procedure Random_Shuffle (A : in out T_Arr) with
      Post => Multiset_Unchanged (A'Old, A);

end Random_Shuffle_P;
