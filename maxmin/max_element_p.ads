with Types; use Types;

package Max_Element_P with
     Spark_Mode is

   function Max_Element (A : T_Arr) return Positive with
      Pre  => A'Length > 0,
      Post => (Max_Element'Result >= A'First)
      and then (Max_Element'Result <= A'Last)
      and then
      (for all I in A'First .. A'Last => A (I) <= A (Max_Element'Result))
      and then
      (for all I in A'First .. Max_Element'Result - 1 =>
         A (I) < A (Max_Element'Result));

end Max_Element_P;
