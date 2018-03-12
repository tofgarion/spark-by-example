with Types; use Types;
with Lower_Bound_P; use Lower_Bound_P;

package Min_Element_P with
  SPARK_Mode is
   
   function Min_Element(A: T_Arr) return Option  with
     Contract_Cases => 
     (A'Length = 0 => not Min_Element'Result.Exists,
      A'Length > 0 => Min_Element'Result.Exists
	and then Min_Element'Result.Value <= A'Last
	and then Min_Element'Result.Value >= A'First
	and then Lower_Bound(A,A'Last,A(Min_Element'Result.Value))
	and then 
	(if Min_Element'Result.Value > A'First 
	   then Strict_Lower_Bound(A,Min_Element'Result.Value-1,A(Min_Element'Result.Value))));
    -- Others => not Min_Element'Result.Exists);
     
     
end Min_Element_P;
