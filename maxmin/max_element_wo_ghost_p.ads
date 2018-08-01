with Types; use Types;

package Max_Element_Wo_Ghost_P with
     Spark_Mode is

   function Max_Element (A : T_Arr) return Option with
      Contract_Cases =>
      (A'Length = 0 => not Max_Element'Result.Exists,
       A'Length > 0 =>
         Max_Element'Result.Value >= A'First
         and then (Max_Element'Result.Value <= A'Last)
         and then
         (for all I in A'First .. A'Last =>
            A (I) <= A (Max_Element'Result.Value))
         and then
         (for all I in A'First .. Max_Element'Result.Value - 1 =>
            A (I) < A (Max_Element'Result.Value)));

end Max_Element_WO_Ghost_P;
