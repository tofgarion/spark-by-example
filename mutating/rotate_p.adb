package body Rotate_P with
   Spark_Mode
 is

   procedure Rotate
     (A : in out T_Arr;
      N :        Positive)
   is
   begin
      Reverse_In_Place (A (A'First .. A'First + (N - 1)));
      Reverse_In_Place (A (A'First + N .. A'Last));
      Reverse_In_Place (A);
   end Rotate;
end Rotate_P;
