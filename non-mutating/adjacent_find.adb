-- implementation of Adjacent_Find

package body Adjacent_Find with
  SPARK_Mode is

   function Adjacent_Find (A : T_Arr) return Option Is
      Result: Option := (Exists => False, Value => 1);
   begin
      for I in A'First .. A'Last - 1 Loop
         if (A(I) = A(I + 1)) Then
            Result.Exists := True;
            Result.Value := I;

            return Result;
         end if;

         pragma Loop_Invariant
           (not Has_Equal_Neighbors.Has_Equal_Neighbors(A(A'First .. I + 1)));
         pragma Loop_Invariant
           (Result.Exists = False);
      end loop;
      pragma Annotate (GNATprove, False_Positive,
                       "overflow check might fail",
                       "reviewed by C. Garion");

      return Result;
   end Adjacent_Find;
end Adjacent_Find;
