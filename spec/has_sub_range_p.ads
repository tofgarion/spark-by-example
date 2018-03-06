-- The Has_Sub_Range function function is used to specify if an array
-- is a subrange of another one.

with Types;          use Types;
with Equal_Ranges_P; use Equal_Ranges_P;

package Has_Sub_Range_P with
     Spark_Mode,
     Ghost is

   function Equal_Subrange
     (A : T_Arr;
      J : Integer;
      B : T_Arr) return Boolean is
     (A (J .. J - 1 + B'Length) = B) with
      Pre => A'Length >= B'Length
      and then A'Last < Positive'Last
      and then J in A'First .. A'Last + 1 - B'Length;

   function Has_Sub_Range_In_Prefix
     (A    : T_Arr;
      Last : Integer;
      B    : T_Arr) return Boolean is
     (for some J in A'First .. Last => Equal_Subrange (A, J, B)) with
      Pre => A'Length >= B'Length
      and then A'Last < Positive'Last
      and then Last <= A'Last + 1 - B'Length;

   function Has_Sub_Range
     (A : T_Arr;
      B : T_Arr) return Boolean is
     (Has_Sub_Range_In_Prefix (A, A'Last + 1 - B'Length, B)) with
       Pre => A'Length >= B'Length and then A'Last < Positive'Last;
     
     function Has_Sub_Range_In_Postfix
       (A     : T_Arr;
	First : Integer;
	B     : T_Arr) return Boolean is
	(for Some J in First .. A'Last-B'Length+1 => Equal_Subrange(A, J, B)) with
	Pre => A'Length >B'Length
	and then A'Last<Positive'Last
	and then First <= A'Last - B'Length + 1;
	

end Has_Sub_Range_P;
