with chap3;       use chap3;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Test_Search is
   package SU renames Ada.Strings.Unbounded;

   A      : constant T_Arr := (1, 5, 3, 2, 8, 8, 2, 1, 5, 4);
   A_Sing : constant T_Arr := (1 => 1);

   function T_Arr_To_String(A : T_Arr) return String is
      Res : SU.Unbounded_String := SU.To_Unbounded_String("(");
   begin
      for I in A'Range loop
         SU.Append(Res, T'Image(A (I)));
      end loop;

      SU.Append(Res, " )");
      return SU.To_String(Res);
   end T_Arr_To_String;

   procedure My_Search_Test
     (A        : T_Arr;
      B        : T_Arr;
      Size_B   : Natural;
      Expected : Natural) is
      Res : Natural;
   begin
      Res := Search(A, A'Length, B, Size_B);

      Put (T_Arr_To_String(B (B'First .. B'First + Size_B - 1)) &
             " in " & T_Arr_To_String(A) & "? ");
      if Res = Expected then
         if Expected = A'Length then
            Put_Line ("OK, not found");
         else
            Put_Line ("OK, at index" & Integer'Image(Res));
         end if;
      else
         Put_Line ("KO, found index" & Integer'Image(Res) &
                   " instead of" & Integer'Image(Expected));
      end if;
   end My_Search_Test;

begin
   My_Search_Test(A, (3, 2, 8), 3, 2);
   My_Search_Test(A, (1, 5, 4), 3, 7);
   My_Search_Test(A, (1, 5, 4), 2, 0);
   My_Search_Test(A, (1, 5, 4, 3), 4, A'Length);
   My_Search_Test(A_Sing, (1 => 1), 1, 0);
   My_Search_Test(A_Sing, (1 => 2), 1, 1);
end Test_Search;
