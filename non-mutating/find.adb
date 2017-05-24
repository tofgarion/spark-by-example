-- implementation of a better version of Find

package body Find with
  SPARK_Mode is

   function Find (A : T_Arr; Val : T) return Option Is
      Result: Option := (Exists => False, Value => 1);
   begin
      for I in A'Range Loop
         if A(I) = Val Then
            Result.Exists := True;
            Result.Value := I;

            return Result;
         end if;

         pragma Loop_Invariant
           (not Has_Value.Has_Value(A(A'First..I), Val));
         pragma Loop_Invariant
           (Result.Exists = False);
      end loop;

      return Result;
   end Find;
end Find;
