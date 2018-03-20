with Types; use Types;
with Replace_Check_P; use Replace_Check_P;

package Replace_P with
  Spark_Mode is
   procedure Replace ( A : in out T_Arr; Val : T ; Rep : T) with
     Post => Replace_Check(A'Old, A, Val, Rep);
end Replace_P;
