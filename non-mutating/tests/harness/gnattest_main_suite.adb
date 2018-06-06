--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with Adjacent_Find_P.Test_Data.Tests.Suite;
with Count_P.Test_Data.Tests.Suite;
with Equal_P.Test_Data.Tests.Suite;
with Equal_Rev_P.Test_Data.Tests.Suite;
with Mismatch_P.Test_Data.Tests.Suite;
with Find_End_P.Test_Data.Tests.Suite;
with Find_First_Of_P.Test_Data.Tests.Suite;
with Find_P.Test_Data.Tests.Suite;
with Naive_Find_P.Test_Data.Tests.Suite;
with Search_N_P.Test_Data.Tests.Suite;
with Search_P.Test_Data.Tests.Suite;
with Search_With_Ghost_P.Test_Data.Tests.Suite;
with Search_Wo_Ghost_P.Test_Data.Tests.Suite;
with Heap_Predicates.Test_Data.Tests.Suite;

package body Gnattest_Main_Suite is

   Result : aliased AUnit.Test_Suites.Test_Suite;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Result.Add_Test (Adjacent_Find_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Count_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Equal_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Equal_Rev_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Mismatch_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Find_End_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Find_First_Of_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Find_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Naive_Find_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Search_N_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Search_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Search_With_Ghost_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Search_Wo_Ghost_P.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Heap_Predicates.Test_Data.Tests.Suite.Suite);

      return Result'Access;

   end Suite;

end Gnattest_Main_Suite;
--  end read only
