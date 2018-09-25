package body Accumulate_P with
   Spark_Mode
 is

   function Accumulate
     (A    : T_Arr;
      Init : T)
      return T
   is
      Result : T := Init;
   begin
      for J in A'Range loop
         pragma Assert (Acc_Def (A, A'First, J, Init).OK);
         Result := Result + A (J);
         pragma Loop_Invariant (Result = Acc_Def (A, A'First, J, Init).Value);

      end loop;

      return Result;
   end Accumulate;
end Accumulate_P;
