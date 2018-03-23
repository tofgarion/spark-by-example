with Types;   use Types;
with Count_P; use Count_P;

package Remove_Count_P with
     Spark_Mode,
     Ghost is
   function Remove_Count
     (A   : T_Arr;
      Val : T) return Integer is
     (A'Length - Count (A, Val) - 1) with
      Pre  => A'Length > 0,
      Post => Remove_Count'Result in -1 .. A'Length - 1;
end Remove_Count_P;
