with Types; use Types;
with Occ_P; use Occ_P;

package Remove_Count_P with
   Spark_Mode,
   Ghost
 is
   function Remove_Count
     (A   : T_Arr;
      Val : T)
      return Natural is (A'Length - Occ (A, Val)) with
      Pre  => A'Length > 0,
      Post => Remove_Count'Result in 0 .. A'Length;
end Remove_Count_P;
