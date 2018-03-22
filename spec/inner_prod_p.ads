with Types;            use Types;
with Inner_Prod_Def_P; use Inner_Prod_Def_P;

package Inner_Prod_P with
     Spark_Mode,
     Ghost is
   function Inner_Prod
     (A    : T_Arr;
      B    : T_Arr;
      Init : T) return T is
     (Inner_Prod_Def (A, B, Init)) with
       Pre => A'Length = B'Length,
       Post => Inner_Prod'Result in T;
end Inner_Prod_P;
