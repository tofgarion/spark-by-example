-- a simple package to hold all needed types for SPARK by example

package Types is
   type T is new Integer;
   type T_Arr is array (Positive range <>) of T;
   type H_Arr is array (Natural range <>) of T;
   MAX_SIZE : constant Positive := 1000;

   type Option (Exists : Boolean := False) is record
      case Exists is
         when True =>
            Value : Integer;
         when False =>
            null;
      end case;
   end record;

   type Option_Pair (Exists : Boolean := False) is record
      case Exists is
         when True =>
            Lower : Integer;
            Upper : Integer;
         when False =>
            null;
      end case;
   end record;
   
   type Heap  is record
      A : H_Arr(0 .. MAX_SIZE);
      Size : Natural := 0;
   end record;
   

end Types;
