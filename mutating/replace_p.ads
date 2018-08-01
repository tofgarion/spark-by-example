with Types;         use Types;
with Is_Replaced_P; use Is_Replaced_P;

package Replace_P with
   Spark_Mode
 is
   procedure Replace
     (A   : in out T_Arr;
      Val :        T;
      Rep :        T) with
      Post => Is_Replaced (A'Old, A, Val, Rep);
end Replace_P;
