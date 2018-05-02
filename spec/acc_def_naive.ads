with Types; use Types;

package Acc_Def_Naive with
     Spark_Mode,
     Ghost is
   
   
   function Acc_Def_Rec
     (A    : T_Arr;
      Init : T) return T is
     (case A'Length is
        when 0      => Init,
        when others =>
       Acc_Def_Rec (A (A'First .. A'Last - 1), Init) + A (A'Last));
       
   pragma Annotate (Gnatprove, Terminating, Acc_Def_Rec);

   function Acc_Def (A : T_Arr; Init : T) return T is (Acc_Def_Rec (A, Init));


end Acc_Def_Naive;
