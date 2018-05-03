with Types;    use Types;
with Sorted_P; use Sorted_P;
--with Is_Sorted_Lemma; use Sorting_Lemmas;

package Is_Sorted_P with
     Spark_Mode is

   procedure Weakly_To_Sorted (A : T_Arr) with
      Ghost,
      Pre  => Weakly_Sorted (A),
      Post => Sorted (A);

   function Is_Sorted (A : T_Arr) return Boolean with
      Contract_Cases =>
      (Sorted (A) => Is_Sorted'Result = True,
       others     => Is_Sorted'Result = False);

end Is_Sorted_P;
