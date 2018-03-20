package body Remove_Copy_With_Aux_P with
     Spark_Mode is

   procedure Remove_Copy_Aux
     (A   :        T_Arr;
      B   : in out T_Arr;
      Val :        T;
      J   : in out Integer)
   is
   begin
      if A (A'Last) /= Val then
         B (J) := A (A'Last);
         J     := J + 1;
      end if;
   end Remove_Copy_Aux;

 --  procedure Remove_Copy (A : in T_Arr; B : in out T_Arr; Val : T) is
 --     J : Integer := B'First;
 --  begin
 --     for I in A'Range loop
 --        Remove_Copy_Aux (A (A'First .. I), B, Val, J);
 --     end loop;
 --     pragma Assert (J = B'Last + 1);
 --  end Remove_Copy;

end Remove_Copy_With_Aux_P;
