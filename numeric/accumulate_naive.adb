package body Accumulate_Naive with
     Spark_Mode is

   function Accumulate_Naive (A : T_Arr; Init : T) return T is
      Result : T := Init;
   begin
      for I in A'Range loop

         pragma Assert (Acc_Def (A (A'First .. I), Init) in T);
         Result := Result + A (I);
         pragma Loop_Invariant (Result = Acc_Def (A (A'First .. I), Init));

      end loop;
      return Result;

   end Accumulate_Naive;

end Accumulate_Naive;
