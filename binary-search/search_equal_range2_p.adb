package body Search_Equal_Range2_P with
     Spark_Mode is

   function Search_Equal_Range2 (A : T_Arr; V : T) return Option_Pair is

      Result : Option_Pair := (Exists => False);
      Middle : Integer     := A'First;
      Left   : Integer     := A'First;
      Right  : Integer     := A'Last + 1;
   begin
      if A'Length > 0 then
         Result := (Exists => True, Lower => A'First, Upper => A'Last + 1);
         while Right > Left loop
            Middle := Left + (Right - Left) / 2;

            if A (Middle) < V then
               Left := Middle + 1;
            elsif V < A (Middle) then
               Right := Middle;
            else
               exit;
            end if;

            pragma Loop_Variant (Decreases => Right - Left);
            pragma Loop_Invariant
              (A'First <= Left
               and then Left <= Right
               and then Right <= A'Last + 1);
            pragma Loop_Invariant
              (if
                 Left /= A'First
               then
                 Strict_Upper_Bound (A (A'First .. Left - 1), V));
            pragma Loop_Invariant
              (if
                 Right /= A'Last + 1
               then
                 Strict_Lower_Bound (A (Right .. A'Last), V));

         end loop;

         if Left < Right then

            Result.Lower := Search_Lower_Bound (A (Left .. Middle), V).Value;

            Middle := Middle + 1;

            if Middle < A'Last + 1 then
               Result.Upper :=
                 Search_Upper_Bound (A (Middle .. A'Last), V).Value;
            else
               Result.Upper := A'Last + 1;
            end if;

         else
            Result.Lower := Left;
            Result.Upper := Right;

         end if;

      end if;

      return Result;

   end Search_Equal_Range2;

end Search_Equal_Range2_P;
