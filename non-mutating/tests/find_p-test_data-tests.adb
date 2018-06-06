--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Find_P.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

--  begin read only
--  end read only
package body Find_P.Test_Data.Tests is

   --  begin read only
   --  id:2.2/01/
   --
   --  This section can be used to add global variables and other elements.
   --
   --  end read only

   --  begin read only
   --  end read only

--  begin read only
   procedure Test_Find (Gnattest_T : in out Test);
   procedure Test_Find_160227 (Gnattest_T : in out Test) renames Test_Find;
   --  id:2.2/1602273781fb04eb/Find/1/0/
   procedure Test_Find (Gnattest_T : in out Test) is
   --  find_p.ads:9:4:Find
   --  end read only
   begin

      -- testing with empty array
      Assert(not Find(Gnattest_T.Empty_Array, 0).Exists,
             "Empty array does not contain any value.");
      Assert(not Find(Gnattest_T.Empty_Array, -5).Exists,
             "Empty array does not contain any value.");
      Assert(not Find(Gnattest_T.Empty_Array, 2).Exists,
             "Empty array does not contain any value.");

      -- testing with singleton
      Assert(not Find(Gnattest_T.Singleton_Array_Neg, 0).Exists,
             "Singleton_Array_Neg does not contain value 0.");
      Assert(Find(Gnattest_T.Singleton_Array_Neg, -5).Exists,
             "Singleton_Array_Neg does contain value -5.");
      Assert(not Find(Gnattest_T.Singleton_Array_Neg, 2).Exists,
             "Singleton_Array_Neg does not contain value 2.");
      Assert(Find(Gnattest_T.Singleton_Array_Zero, 0).Exists,
             "Singleton_Array_Zero does contain value 0.");
      Assert(not Find(Gnattest_T.Singleton_Array_Zero, -5).Exists,
             "Singleton_Array_Zero does not contain value -5.");
      Assert(not Find(Gnattest_T.Singleton_Array_Zero, 2).Exists,
             "Singleton_Array_Zero does not contain value 2.");
      Assert(not Find(Gnattest_T.Singleton_Array_Pos, 0).Exists,
             "Singleton_Array_Pos does not contain value 0.");
      Assert(not Find(Gnattest_T.Singleton_Array_Pos, -5).Exists,
             "Singleton_Array_Pos does not contain value -5.");
      Assert(Find(Gnattest_T.Singleton_Array_Pos, 2).Exists,
             "Singleton_Array_Pos does contain value 2.");

      -- testing with simple array
      For Val of Gnattest_T.Simple_Array loop
         Assert(Find(Gnattest_T.Simple_Array, Val).Exists,
                "Simple_Array does contain value " & Val'Image & ".");
      End Loop;

      For Val Of Gnattest_T.Wrong_Values loop
         Assert(not Find(Gnattest_T.Simple_Array, Val).Exists,
                "Simple_Array does contain value " & Val'Image & ".");
      End Loop;

--  begin read only
end Test_Find;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
null;
--  begin read only
--  end read only
end Find_P.Test_Data.Tests;
