-- implementation of Search_N function

package body Search_N_P with
     Spark_Mode is

   function Search_N (A : T_Arr; Val : T; N : Positive) return Option is
      Result : Option   := (Exists => False);
      Start  : Positive := A'First;
   begin
      if A'Length < N then
         return Result;
      end if;

      for I in A'Range loop
         if A (I) /= Val then
            Start := I + 1;
         elsif I + 1 - Start = N then
            Result := (Exists => True, Value => Start);

            -- Pragma Assert (Constant_Range_From_Location (A, Val, Start, N));
            -- Pragma Assert (Has_Constant_Subrange (A, Val, N));

            return Result;
         end if;

         Pragma Loop_Invariant (Not Result.Exists);
         Pragma Loop_Invariant (Start in A'First .. A'Last + 1);
         Pragma Loop_Invariant (If Start <= I Then Constant_Range_From_Location (A, Val, Start, I + 1 - Start));
         Pragma Loop_Invariant (Not Has_Constant_Subrange (A (A'First .. I), Val, N));
      end loop;

      -- Pragma Assert (Not Has_Constant_Subrange (A (A'First .. A'Last), Val, N));
      Pragma Assert (Not Has_Constant_Subrange (A, Val, N));

      return Result;

   end Search_N;
end Search_N_P;
