-- common fixtures for tests

with Aunit.Test_Fixtures;
with Types; use Types;

Package Common_Fixtures is
   type Array_Common_Fixture is new AUnit.Test_Fixtures.Test_Fixture
      with Record
         Empty_Array          : T_Arr (1 .. 0) := (others => 0);
         Singleton_Array_Neg  : T_Arr (1 .. 1) := ( 1     => -5 );
         Singleton_Array_Zero : T_Arr (1 .. 1) := ( 1     => 0 );
         Singleton_Array_Pos  : T_Arr (1 .. 1) := ( 1     => 2 );
         Simple_Array         : T_Arr (1 .. 7) := ( -5, 2, -6, 0, 7, 4, 3 );
         Wrong_Values         : T_Arr (1 .. 8) := (-10, -8, -1, 1, 6, 5, 8, 10);
      End Record;
End Common_Fixtures;
