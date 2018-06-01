-- only here for gnattest

package body Naive_Find_Contract_Pb with
     Spark_Mode is

   function Find (A : T_Arr; Val : T) return Positive is
   begin
      return 1;
   end Find;

end Naive_Find_Contract_Pb;
