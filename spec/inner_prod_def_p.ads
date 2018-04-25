with Types;    use Types;
with Overflow; use Overflow;

package Inner_Prod_Def_P with
     Spark_Mode,
     Ghost is
   function Inner_Prod_Def_Rec
     (A,B  : T_Arr;
      F, L : Integer;
      Init : T) return T_Option is
     (if L < F then (True, Init)
      else
        (if
           Inner_Prod_Def_Rec (A,B, F, L - 1, Init).OK
           and then Multiply_No_Overflow
             (B(B'First + L),
             A (A'First + L))
        and then Add_No_Overflow (Inner_Prod_Def_Rec (A, B, F, L - 1,Init).Value,
                                 A(A'First + L)*B(B'First + L))
         then
           (True, Inner_Prod_Def_Rec (A,B, F, L - 1, Init).Value + B(B'First + L) * A (A'First + L))
         else (OK => False))) with
   Pre => A'Length = B'Length
     and then (if L >= F then L in 0 .. A'Length - 1 and F in 0 .. A'Length - 1);
   pragma Annotate (Gnatprove, Terminating, Inner_Prod_Def_Rec);

   function Inner_Prod_Def
     (A ,B   : T_Arr;
      F, L : Integer;
      Init : T) return T_Option is
     (Inner_Prod_Def_Rec (A,B, F, L, Init)) with
   Pre => A'Length = B'Length
     and then
     (if L >= F then L in 0 .. A'Length - 1 and F in 0 .. A'Length - 1);

end Inner_Prod_Def_P;
