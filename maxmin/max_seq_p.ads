with Types;                    use Types;
with Max_Element_With_Ghost_P; use Max_Element_With_Ghost_P;
with Has_Value_P;              use Has_Value_P;
with Upper_Bound_P;            use Upper_Bound_P;

package Max_Seq_P with
     Spark_Mode is
   function Max_Seq (A : T_Arr) return T with
      Pre  => A'Length > 0,
      Post => (Has_Value (A, Max_Seq'Result))
      and then (Upper_Bound (A, Max_Seq'Result));

end Max_Seq_P;
