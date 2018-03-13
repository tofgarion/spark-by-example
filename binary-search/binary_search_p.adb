package body Binary_Search_P with
     Spark_Mode is
   function Binary_Search (A : T_Arr; Val : T) return Boolean is
      Low : Option := Search_Lower_Bound (A, Val);
      I   : Positive;
   begin
      if Low.Exists then
         I := Low.Value;
         return (I <= A'Last and then A (I) <= Val);
      else
         return False;
      end if;

   end Binary_Search;
end Binary_Search_P;
