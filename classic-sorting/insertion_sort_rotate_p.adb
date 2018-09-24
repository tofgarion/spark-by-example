with Types;                use Types;
with Sorted_P;             use Sorted_P;
with Multiset_Predicates;  use Multiset_Predicates;
with Search_Upper_Bound_P; use Search_Upper_Bound_P;
with Swap_Array_P;         use Swap_Array_P;
with Upper_Bound_P;        use Upper_Bound_P;
with Lower_Bound_P;        use Lower_Bound_P;

package body Insertion_Sort_P with
   Spark_Mode
 is

   procedure Insertion_Sort (A : in out T_Arr) is
      K : Integer;
   begin
      if A'Length = 0 then
         return;
      end if;

      for J in A'Range loop
         K :=
           (if J = A'First then A'First
            else Search_Upper_Bound (A (A'First .. J - 1), A (J)).Value);
         if K < J then
            Rotate (A (K .. J), J - K);
         end if;
      end loop;

   end Insertion_Sort;
end Insertion_Sort_P;
