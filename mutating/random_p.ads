with Types; use Types;
with Ada.Numerics.Discrete_Random;

package Random_P with
   Spark_Mode
 is

   function Random_Number
     (First : Positive;
      Last  : Positive)
      return Positive with
      Pre  => Last >= First,
      Post => Random_Number'Result in First .. Last;

end Random_P;
