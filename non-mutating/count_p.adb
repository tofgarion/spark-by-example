-- implementation of a version of Count

package body Count_P with
   Spark_Mode
 is

   function Count
     (A   : T_Arr;
      Val : T)
      return Natural
   is
      Result : Natural := 0;
   begin
      for I in A'Range loop
         if A (I) = Val then
            Result := Result + 1;
         end if;

         pragma Loop_Invariant (Result <= A'Length);
         pragma Loop_Invariant (Result = Occ (A (A'First .. I), Val));
      end loop;

      return Result;
   end Count;
end Count_P;
