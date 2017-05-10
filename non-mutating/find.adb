-- implementation of a better version of Find

package body Find with
  SPARK_Mode is

   function Find (A : T_Arr; Val : T) return Positive Is
   begin
      for I in A'Range Loop
         if A(I) = Val Then
            return I;
         end if;

         pragma Loop_Invariant
           (for all J In A'First .. I => A (J) /= Val);
      end loop;

      return A'Last + 1;
   end Find;
end Find;
