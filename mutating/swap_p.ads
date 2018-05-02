with Types; use Types;

package Swap_P with
     Spark_Mode is
   procedure Swap (P : in out T; Q : in out T) with
      Post => P = Q'Old and then Q = P'Old;

end Swap_P;
