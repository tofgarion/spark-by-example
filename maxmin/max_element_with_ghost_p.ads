with Types;         use Types;
with Upper_Bound_P; use Upper_Bound_P;
package Max_Element_With_Ghost_P with
     Spark_Mode is

   function Max_Element_With_Ghost (A : T_Arr) return Option with
      Contract_Cases =>
      (A'Length = 0 => not Max_Element_With_Ghost'Result.Exists,
       A'Length > 0 =>
         Max_Element_With_Ghost'Result.Exists
         and then Max_Element_With_Ghost'Result.Value >= A'First
         and then Max_Element_With_Ghost'Result.Value <= A'Last
         and then Upper_Bound (A, A (Max_Element_With_Ghost'Result.Value))
         and then Strict_Upper_Bound
           (A (A'First .. Max_Element_With_Ghost'Result.Value - 1),
            A (Max_Element_With_Ghost'Result.Value)));

end Max_Element_With_Ghost_P;
