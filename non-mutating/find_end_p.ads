-- specification of Find_end

with Types;           use Types;
with Has_Sub_Range_P; use Has_Sub_Range_P;


package Find_End_P with
  Spark_Mode is
   
   Function Find_End (A : T_Arr; B: T_arr) return Option with
     Pre            =>A'Last < Positive'Last and then B'First <= B'Last,
     Contract Cases =>
     (B'Length = 0 => not Find_End'Result.Exists,
      A'Length < B'Length => not Find_End'Result.Exists,
      A'Length >=B'Length and then Has_Sub_Range(A,B) =>
	Find_End'Result.Exists
	and then Equal_Subrange(A, Find_End'Result.Value -1, B)
	and then 
	(if
	   Find_End'Result.Value < A'Last+1-B'Length
	   then
             (not Has_Sub_Range_In_Postfix(A, Find_End'Result.Value-1,B))),
       others  => not Search'Result.Exists;
     
     
     
end Find_End_P;
   
