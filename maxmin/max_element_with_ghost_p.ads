with Types;         use Types;
with Upper_Bound_P; use Upper_Bound_P;

package Max_Element_With_Ghost_P with
     Spark_Mode is

   function Max_Element_With_Ghost (A : T_Arr) return Positive with
      Pre  => A'Length > 0,
      Post => (Max_Element_With_Ghost'Result >= A'First)
      and then (Max_Element_With_Ghost'Result <= A'Last)
      and then (Upper_Bound (A, A (Max_Element_With_Ghost'Result)))
      and then
      (Strict_Upper_Bound
         (A (A'First .. Max_Element_With_Ghost'Result - 1),
          A (Max_Element_With_Ghost'Result)));

end Max_Element_With_Ghost_P;
