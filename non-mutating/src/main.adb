with Ada.Text_IO; use Ada.Text_IO;
with Find_End_P; use Find_End_P;
with Types; use Types;
procedure Main is

   A: T_arr :=(1,2,3,4,5,6,1,2,3,4,5,6,1,2,3,4,5,6);
   B: T_arr :=(1,2,3);
   res : Option;
begin
   res := Find_End(A,B);
   if res.Exists then
      Put_Line(Integer'Image(res.Value));
   else
      Put_Line("Fail.");
   end if;

end Main;
