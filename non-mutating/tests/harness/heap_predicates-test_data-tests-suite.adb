--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Heap_Predicates.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Heap_Predicates.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_Heap_Left_1611f1 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Heap_Right_185646 : aliased Runner_1.Test_Case;
   Case_3_1_Test_Heap_Parent_615a09 : aliased Runner_1.Test_Case;
   Case_4_1_Test_Is_Heap_Def_d9efd2 : aliased Runner_1.Test_Case;
   Case_5_1_Test_Heap_Maximum_Child_f0ee3b : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_Heap_Left_1611f1,
         "heap_predicates.ads:6:4:",
         Test_Heap_Left_1611f1'Access);
      Runner_1.Create
        (Case_2_1_Test_Heap_Right_185646,
         "heap_predicates.ads:9:4:",
         Test_Heap_Right_185646'Access);
      Runner_1.Create
        (Case_3_1_Test_Heap_Parent_615a09,
         "heap_predicates.ads:12:4:",
         Test_Heap_Parent_615a09'Access);
      Runner_1.Create
        (Case_4_1_Test_Is_Heap_Def_d9efd2,
         "heap_predicates.ads:15:4:",
         Test_Is_Heap_Def_d9efd2'Access);
      Runner_1.Create
        (Case_5_1_Test_Heap_Maximum_Child_f0ee3b,
         "heap_predicates.ads:23:4:",
         Test_Heap_Maximum_Child_f0ee3b'Access);

      Result.Add_Test (Case_1_1_Test_Heap_Left_1611f1'Access);
      Result.Add_Test (Case_2_1_Test_Heap_Right_185646'Access);
      Result.Add_Test (Case_3_1_Test_Heap_Parent_615a09'Access);
      Result.Add_Test (Case_4_1_Test_Is_Heap_Def_d9efd2'Access);
      Result.Add_Test (Case_5_1_Test_Heap_Maximum_Child_f0ee3b'Access);

      return Result'Access;

   end Suite;

end Heap_Predicates.Test_Data.Tests.Suite;
--  end read only
