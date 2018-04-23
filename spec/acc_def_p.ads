with Types; use Types;
with Overflow; use Overflow;

package Acc_Def_P with
     Spark_Mode,
     Ghost is
   
   -- Thanks to Claire Dross from Adacore for the help and the solutions provided to prove this 
   -- program, in particular concerning the handeling of overflows.

   
   function Acc_Def_Rec
     (A    : T_Arr;
      F,L : Integer;
      Init : T) return T_option is
      (if L < F then (True, Init)
      else
	(if Acc_Def_Rec (A, F, L - 1, Init).OK and then Add_No_Overflow (Acc_Def_Rec (A, F, L - 1, Init).Value, A (L)) 
	   then
	  (True, Acc_Def_Rec (A, F, L - 1, Init).Value + A (L)) else (OK => False)))
	    with Pre => (if L >= F then L in A'Range and F in A'Range); 
	  pragma Annotate (Gnatprove, Terminating, Acc_Def_Rec);

	  function Acc_Def (A : T_Arr; F,L :Integer;  Init : T) return T_option 
	  is 
	     (Acc_Def_Rec (A,F,L, Init))
	       with Pre => (if L >= F then L in A'Range and F in A'Range);


end Acc_Def_P;
