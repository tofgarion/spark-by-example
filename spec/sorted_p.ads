with Types; use Types;

package Sorted_P with
     Spark_Mode,
     Ghost is

   function Sorted
     (A : T_Arr) return Boolean is
     (for all J in A'Range =>
        (for all I in A'First .. J - 1 => A (I) <= A (J)));

end Sorted_P;
