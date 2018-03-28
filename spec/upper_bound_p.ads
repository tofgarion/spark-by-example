with Types; use Types;

package Upper_Bound_P with
     Spark_Mode,
     Ghost is
   function Upper_Bound
     (A   : T_Arr;
      Val : T) return Boolean is
     (for all I in A'Range => A (I) <= Val);

   function Strict_Upper_Bound
     (A   : T_Arr;
      Val : T) return Boolean is
      (for all I in A'Range => A (I) < Val);
      
      function Max_Element_Def(A : T_Arr; Max : Natural) return Boolean
      is
	 (Max in A'Range and then Upper_Bound(A,A(Max)));

end Upper_Bound_P;
