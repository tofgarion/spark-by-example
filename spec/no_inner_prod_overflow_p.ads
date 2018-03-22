with Types;        use Types;
with Inner_Prod_P; use Inner_Prod_P;

package No_Inner_Prod_Overflow_P with
     Spark_Mode,
     Ghost is

   function Inner_Prod_Bounds
     (A    : T_Arr;
      B    : T_Arr;
      Init : T) return Boolean is
     (for all J in 0 .. A'Length - 1 =>
        Inner_Prod
          (A (A'First .. A'First + J),
           B (B'First .. B'First + J),
           Init) in
          T) with
       Pre => A'Length = B'Length;

end No_Inner_Prod_Overflow_P;
