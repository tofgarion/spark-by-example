--  This package provides an implementation of case studies from the
--  "ACSL by Example" technical report, chapter 6, from
--  http://www.fokus.fraunhofer.de/de/sqc/_download_sqc/ACSL-by-Example.pdf

package Chap7 with
     Spark_Mode => On is

   Max_Stack_Size : constant := 100;
   type Pointer_Range is range 0 .. Max_Stack_Size;

   type Stack is private;

   function Empty_Stack (S : Stack) return Boolean;

   function Size_Stack (S : Stack) return Pointer_Range;

   procedure Push (I : in Integer; S : in out Stack) with
      Pre  => (Size_Stack (S) < Max_Stack_Size),
      Post => (not Empty_Stack (S));

   procedure Pop (I : out Integer; S : in out Stack) with
      Pre => (not Empty_Stack (S));

private

   subtype Stack_Range is Pointer_Range range 1 .. Max_Stack_Size;

   type Stack_Array is array (Stack_Range) of Integer;
   type Stack is record
      Vector  : Stack_Array;
      Pointer : Pointer_Range;
   end record;

   function Empty_Stack (S : Stack) return Boolean is (S.Pointer = 0);

   function Size_Stack (S : Stack) return Pointer_Range is (S.Pointer);

end Chap7;
