with Types; use Types;

package Replace_P with
  Spark_Mode,
  Ghost is
   function Replace ( A : T_Arr ; B : T_Arr ; Val : T ; Rep : T ) return Boolean is
      (for all I in A'Range => if A(I) = Val then B(I) = Rep else B(I)=A(I)) with
	Pre => A'Length = B'Length;
      end Replace_P;
