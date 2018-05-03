with Types; use Types;

package Sorted_P with
     Spark_Mode,
     Ghost is

   function Weakly_Sorted
     (A : T_Arr) return Boolean is
     (if
        A'Length > 0
      then
        (for all J in A'First .. A'Last - 1 => A (J) <= A (J + 1)));

   function Sorted
     (A : T_Arr) return Boolean is
     (for all J in A'Range =>
        (for all I in A'First .. J - 1 => A (I) <= A (J)));

end Sorted_P;
