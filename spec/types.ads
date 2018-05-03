-- a simple package to hold all needed types for SPARK by example

package Types is

   type T is new Integer;

   type T_Arr is array (Positive range <>) of T;

   type T_Option (OK : Boolean) is record
      case OK is
         when True =>
            Value : T;
         when False =>
            null;
      end case;
   end record;

   MAX_SIZE : constant := 1000;

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

   type Heap is record
      A    : T_Arr (1 .. MAX_SIZE) := (others => 0);
      Size : Natural               := 0;
   end record;

end Types;
