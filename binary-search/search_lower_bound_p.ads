with Types; use Types;
with Sorted_P; use Sorted_P;
with Lower_Bound_P; use Lower_Bound_P;

package Search_Lower_Bound_P with
  SPARK_Mode is
   
   function Search_Lower_Bound
     (A: T_Arr,
	V: T) return Option with
     Pre => Sorted(A),
     Contract_Cases => 
     (A'Length = 0 => not Result.Exists,
      A'Length > 0 => Result.Exists
	and then A'First <= Result.Value
	and then Result.Value <= A'Last+1
	and then Strict_Lower_Bound(A(A'First .. Search_Lower_Bound'Result.Value-1),V)
	and then Lower_Bound(A(Search_Lower_Bound'Result.Value .. A'Last), V));
     
end Search_Lower_Bound;
