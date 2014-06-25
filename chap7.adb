package body Chap7 with
     Spark_Mode => On is

   ----------
   -- Push --
   ----------

   procedure Push (I : in Integer; S : in out Stack) with
      Refined_Post => (S.Pointer = S.Pointer'Old + 1) is
   begin
      S.Pointer            := S.Pointer + 1;
      S.Vector (S.Pointer) := I;
   end Push;

   ---------
   -- Pop --
   ---------

   procedure Pop (S : in out Stack) with
      Refined_Post => (S.Pointer = S.Pointer'Old - 1) is
   begin
      S.Pointer := S.Pointer - 1;
   end Pop;

   ---------------
   -- Top_Stack --
   ---------------

   function Top_Stack (S : in Stack) return Integer is
   begin
      return S.Vector (S.Pointer);
   end Top_Stack;

end Chap7;
