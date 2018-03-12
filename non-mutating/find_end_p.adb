--implemenation if Find_end

package body Find_End_P with
  Spark_Mode is
   
   function Find_End (A : T_Arr; B : T_Arr) return Option is
      Result :Option :=(Exists => False);
   begin
      if(A'Length<B'Length or else B'Length = 0) then
	 return Result;
      end if;
      
      for I in A'First .. A'Last - B'Length +1 loop
	 if A(I..I-1+B'Length) = B then
	    Result := (Exists => True, Value => I);
	    
	 end if;
	 
	 
	 pragma Loop_Variant (Increases => I);
	 pragma Loop_Invariant(if Result.Exists
				 then Equal_Subrange(A,Result.Value,B)
	                         and then Result.Value in A'First .. A'Last-B'Length +1
	                         and then Result.Value <=I
	                         and then (if Result.Value<I
					     then (for all J in Result.Value+1 .. I => not Equal_Subrange(A,J,B))
	                                     else True)
	                         else not Has_Sub_Range_In_Prefix(A,I,B));
	 
	 
      end loop;
      
      
      return Result;
      
   end Find_End;
end Find_End_P;

