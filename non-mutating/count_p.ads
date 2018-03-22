with Types; use Types;
with Occ_P; use Occ_P;

package Count_P with
     Spark_Mode is

   function Count (A : T_Arr; Val : T) return Natural with
      Post =>
      (Count'Result <= A'Length
       and then Count'Result in 0 .. A'Length
       and then Count'Result = Occ (A, Val));

end Count_P;
