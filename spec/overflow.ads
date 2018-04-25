with Types; use Types;

package Overflow with
     Spark_Mode is

   function Add_No_Overflow
     (X, Y : T) return Boolean is
     (Y = 0
      or else (Y > 0 and then T'Last - Y >= X)
     or else (Y < 0 and then T'First - Y <= X))
   with Ghost;

   function Multiply_No_Overflow
     (X, Y : T) return Boolean
     with
       Ghost,
       Contract_Cases =>
         ((X * Y in T) => Multiply_No_Overflow'Result = True,
          others       => Multiply_No_Overflow'Result = False);

end Overflow;
