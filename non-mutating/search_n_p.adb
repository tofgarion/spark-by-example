-- implementation of Search_N function

package body Search_N_P with
   Spark_Mode
 is

   function Search_N
     (A   : T_Arr;
      Val : T;
      N   : Positive)
      return Option
   is
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

            return Result;
         end if;

         pragma Loop_Invariant (not Result.Exists);
         pragma Loop_Invariant (Start in A'First .. I + 1);
         pragma Loop_Invariant
           (if Start <= I then
              Constant_Range_From_Location (A, Val, Start, I + 1 - Start));
         pragma Loop_Invariant
           (not Has_Constant_Subrange (A (A'First .. I), Val, N));
         pragma Loop_Invariant (if Start > A'First then A (Start - 1) /= Val);
      end loop;

      return Result;

   end Search_N;
end Search_N_P;
