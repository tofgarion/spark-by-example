with Types;     use Types;
with Is_Iota_P; use Is_Iota_P;

package Iota_P with
   Spark_Mode
 is
   procedure Iota
     (A   : in out T_Arr;
      Val :        T) with
      Pre  => Val + A'Length <= T'Last,
      Post => Is_Iota (A, Val);
end Iota_P;
