with Types; use Types;
with Sorted_P; use Sorted_P;
with Sorting_Lemmas; use Sorting_Lemmas;

package Is_Sorted_P with
SPARK_Mode
is

   function Is_Sorted (A : T_arr) return Boolean
     with Contract_Cases =>
       (Sorted (A) => Is_Sorted'Result = True,
        others => Is_Sorted'Result = False);

end Is_Sorted_P;
