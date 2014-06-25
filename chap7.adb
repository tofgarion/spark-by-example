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

   procedure Pop (I : out Integer; S : in out Stack) with
      Refined_Post => (S.Pointer = S.Pointer'Old - 1) is
   begin
      I         := S.Vector (S.Pointer);
      S.Pointer := S.Pointer - 1;
   end Pop;

end Chap7;
