-- a simple package to hold all needed types for SPARK by example

package Types is
   type T is new Integer;
<<<<<<< HEAD
   type T_Arr is array (Natural range <>) of T;
=======
   type T_Arr is array (Positive range <>) of T;
   type H_Arr is array (Natural range <>) of T;
>>>>>>> f956d53fcf9eb5ec9f236ade37efe40f4ef49769
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
      A : T_Arr(0 .. MAX_SIZE);
      Size : Natural := 0;
   end record;
   

end Types;
