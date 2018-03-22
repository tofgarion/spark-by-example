with Types; use Types;

package Inner_Prod_Def_P with
     Spark_Mode,
     Ghost is
   function Remove_Last
     (A : T_Arr) return T_Arr is
     (A (A'First .. A'Last - 1)) with
      Pre => A'Length > 0;

   function Inner_Prod_Def
     (A, B : T_Arr;
      Init : T) return T is
     (if A'Length = 0 then Init
      else
        A (A'Last) * B (B'Last) +
        Inner_Prod_Def (Remove_Last (A), Remove_Last (B), Init)) with
	  Pre => A'Length = B'Length,
	  Post => Inner_Prod_Def'Result in T;
   pragma Annotate (Gnatprove, Terminating, Inner_Prod_Def);

end Inner_Prod_Def_P;
