with Ada.Text_IO; use Ada.Text_IO;
with Chap3;
with Chap4;
with Chap5;

procedure Tests with
  Spark_Mode => On
is

   --  package Int_Chap3 is new Chap3 (Integer);
   --  package Int_Chap4 is new Chap4 (Integer);
   package Int_Chap5 is new Chap5 (Integer);

begin
--   Put_Line (Boolean'Image (Equal (A, B, A'Length)));
   null;
end Tests;
