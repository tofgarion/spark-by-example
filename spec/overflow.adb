package body Overflow with
     Spark_Mode is

   -- Thanks to Claire Dross from AdaCore for the help and the solution provided to prove the Multiply_No_Overflow function below.

   function Multiply_No_Overflow (X, Y : T) return Boolean is
      Res : Boolean;
   begin
      case X is
         when 0 =>
            Res := True;
         when -1 =>
            Res := Y /= T'First;
         when T'First .. -2 =>
            Res := Y in T'Last / X .. T'First / X;
            pragma Assert (if Y < T'Last / X - 1 then X * Y > T'Last);
            pragma Assert (if Y < T'Last / X then X * Y > T'Last);
         when 1 .. T'Last =>
            Res := Y in T'First / X .. T'Last / X;
            pragma Assert (if Y < T'First / X - 1 then X * Y < T'First);
            pragma Assert (if Y < T'First / X then X * Y < T'First);
      end case;
      return Res;
   end Multiply_No_Overflow;

end Overflow;
