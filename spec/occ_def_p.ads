with Types; use Types;
package Occ_Def_P with
     Spark_Mode,
     Ghost is

   function Remove_Last
     (A : T_Arr) return T_Arr is
     (A (A'First .. A'Last - 1)) with
      Pre => A'Length > 0,
      Ghost;

   function Occ_Def
     (A   : T_Arr;
      Val : T) return Natural is
     (if A'Length = 0 then 0
      elsif A (A'Last) = Val then Occ_Def (Remove_Last (A), Val) + 1
      else Occ_Def (Remove_Last (A), Val)) with
      Post => Occ_Def'Result <= A'Length;
   pragma Annotate (Gnatprove, Terminating, Occ_Def);
end Occ_Def_P;
