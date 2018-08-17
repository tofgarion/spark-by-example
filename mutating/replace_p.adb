package body Replace_P with
   Spark_Mode
 is
   procedure Replace
     (A   : in out T_Arr;
      Val :        T;
      Rep :        T)
   is
   begin
      for J in A'Range loop
         if A (J) = Val then
            A (J) := Rep;
         end if;

         pragma Loop_Invariant
           (Is_Replaced
              (A'Loop_Entry (A'First .. J), A (A'First .. J), Val, Rep));
         pragma Loop_Invariant
           (if J < A'Last then
              A'Loop_Entry (J + 1 .. A'Last) = A (J + 1 .. A'Last));
      end loop;
   end Replace;
end Replace_P;
