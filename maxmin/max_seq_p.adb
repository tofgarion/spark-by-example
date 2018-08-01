package body Max_Seq_P with
     Spark_Mode is
   function Max_Seq (A : T_Arr) return T is
   begin
      return A (Max_Element (A).Value);
   end Max_Seq;
end Max_Seq_P;
