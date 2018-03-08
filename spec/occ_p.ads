with Types; use Types;
with Occ_Def_P; use Occ_Def_P;

package Occ_P with
  Spark_Mode,
  Ghost is
   function Occ(A:T_Arr; Val : T) return Natural is
      (Occ_Def(A,Val))
	with
	Post => Occ'Result <= A'Length;
      
end Occ_P;
