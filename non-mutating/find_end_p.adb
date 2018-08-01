-- implementation of Find_End

package body Find_End_P with
   Spark_Mode
 is

   function Find_End
     (A : T_Arr;
      B : T_Arr)
      return Option
   is
      Result : Option := (Exists => False);
   begin
      if (A'Length < B'Length or else B'Length = 0) then
         return Result;
      end if;

      for I in A'First .. A'Last - B'Length + 1 loop
         if A (I .. I - 1 + B'Length) = B then
            Result := (Exists => True, Value => I);

            Pragma Assert (Has_Subrange (A, B));
         end if;


         --  Pragma Loop_Invariant
         --    (If Result.Exists Then Result.Value <= I);
         Pragma Loop_Invariant
           (If Result.Exists Then Result.Value In A'First .. A'Last + 1 - B'Length);
         Pragma Loop_Invariant
           (If Result.Exists Then Has_Subrange (A, B));
         Pragma Loop_Invariant
           (If Result.Exists Then Equal_Subrange (A, Result.Value, B));
         Pragma Loop_Invariant
           (If Result.Exists And then Result.Value < I Then Not Has_Subrange (A (Result.Value + 1 .. I - 1 + B'Length), B));

         Pragma Loop_Invariant
           (If (not Result.Exists) Then Not Has_Subrange (A (A'First .. I - 1 + B'Length), B));
         --  pragma Loop_Invariant
         --    (if Result.Exists then
         --       Equal_Subrange (A, Result.Value, B)
         --       and then Result.Value in A'First .. A'Last - B'Length + 1
         --       and then Result.Value <= I
         --       and then
         --       (if Result.Value < I then
         --          (Has_Not_Subrange_In_Range (A, Result.Value + 1, I, B))
         --        else True)
         --     else not Has_Subrange_In_Prefix (A, I, B));

      end loop;

      return Result;

   end Find_End;
end Find_End_P;
