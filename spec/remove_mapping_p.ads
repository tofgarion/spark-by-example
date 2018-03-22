with Types;          use Types;
with Count_P;        use Count_P;
with Remove_Count_P; use Remove_Count_P;

package Remove_Mapping_P with
     Spark_Mode,
     Ghost is
   function Remove_Mapping
     (A   : T_Arr;
      B   : T_Arr;
      Val : T) return Boolean is
     (for all I in A'Range =>
        (if
           A (I) /= Val
         then
           B (B'First+Remove_Count(A(A'First .. I), Val)) =
           A (I))) with
       Pre => A'Length > 0 and then B'Length > 0 and then
       B'Last = B'First + Remove_Count(A,Val);
end Remove_Mapping_P;
