package body Random_P is --with
   --SPARK_Mode is

   function Random_Number
     (First : Positive;
      Last  : Positive) return Positive
   is

      subtype Rng is Positive range First .. Last;
      package Alea is new Ada.Numerics.Discrete_Random (Rng);
      use Alea;

      Rnd_Gen : Generator;
      Result  : Integer;

   begin
      Reset (Rnd_Gen);
      Result := Random (Rnd_Gen);
      if Result < First then
         Result := First;
      elsif Result > Last then
         Result := Last;
      end if;

      return Result;

   end Random_Number;
end Random_P;
