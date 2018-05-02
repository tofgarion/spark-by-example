with Types; use Types;

package Partition_P with
SPARK_Mode, Ghost
is

   function Partition (A : T_Arr; M , Size: Positive) return Boolean
   is
     (for all J in A'First .. M - 1 =>
       (for all K in M .. Size => A (J) <= A (K)))
   with Pre => M in A'First .. Size
   and then Size in A'Range;

end Partition_P;
