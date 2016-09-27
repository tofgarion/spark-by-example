with chap3;       use chap3;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Test_Has_Sub_Range is
   package SU renames Ada.Strings.Unbounded;

   A        : constant T_Arr := (1, 5, 3, 2, 8, 8, 2, 1, 5, 4);
   A_Sing   : constant T_Arr := (1 => 1);
   A_Sing_2 : constant T_Arr := (1 => 0);

   function T_Arr_To_String(A : T_Arr) return String is
      Res : SU.Unbounded_String := SU.To_Unbounded_String("(");
   begin
      for I in A'Range loop
         SU.Append(Res, T'Image(A (I)));
      end loop;

      SU.Append(Res, " )");
      return SU.To_String(Res);
   end T_Arr_To_String;

   procedure My_Has_Sub_Range_Test
     (A        : T_Arr;
      B        : T_Arr;
      Size_B   : Natural;
      Expected : Boolean) is
      Res : Boolean;
   begin
      Res := Has_Sub_Range(A, A'Length, B, Size_B);

      Put (T_Arr_To_String(B (B'First .. B'First + Size_B - 1)) &
             " in " & T_Arr_To_String(A) & "? ");
      if Res = Expected then
         if Expected = False then
            Put_Line ("OK, not found");
         else
            Put_Line ("OK, found");
         end if;
      else
         Put_Line ("KO, found " & Boolean'Image(Res) &
                     " instead of " & Boolean'Image(Expected));
      end if;
   end My_Has_Sub_Range_Test;

begin
   My_Has_Sub_Range_Test(A, (3, 2, 8), 3, True);
   My_Has_Sub_Range_Test(A, (1, 5, 4), 3, True);
   My_Has_Sub_Range_Test(A, (1, 5, 4), 2, True);
   My_Has_Sub_Range_Test(A, (1, 5, 4, 3), 4, False);
   My_Has_Sub_Range_Test(A_Sing, (1 => 1), 1, True);
   My_Has_Sub_Range_Test(A_Sing, (1 => 2), 1, False);
   My_Has_Sub_Range_Test(A_Sing_2, A_Sing_2, A_Sing_2'Length, True);
end Test_Has_Sub_Range;
