-- The Has_Equal_Neighbors function is used to specify if an array has
-- two equal adjacent elements.

with Types; use Types;

package Has_Equal_Neighbors_P with
     Spark_Mode,
     Ghost is
   function Has_Equal_Neighbors
     (A : T_Arr) return Boolean is
     (if (A'Length = 0) then False
      else (for some I in A'First .. A'Last - 1 => A (I) = A (I + 1)));

end Has_Equal_Neighbors_P;
