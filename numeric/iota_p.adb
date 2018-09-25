package body Iota_P with
   Spark_Mode
 is
   procedure Iota
     (A   : in out T_Arr;
      Val :        T)
   is
      Count : T := Val;
   begin
      for I in A'Range loop
         A (I) := Count;
         Count := Count + 1;
         pragma Loop_Invariant (Count = Val + T (I - A'First + 1));
         pragma Loop_Invariant (Is_Iota (A (A'First .. I), Val));
      end loop;
   end Iota;
end Iota_P;
