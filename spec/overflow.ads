with Types; use Types;

package Overflow with
     Spark_Mode,
     Ghost is

   function Add_No_Overflow
     (X, Y : T) return Boolean is
     (Y = 0
      or else (Y > 0 and then T'Last - Y >= X)
      or else (Y < 0 and then T'First - Y <= X));

end Overflow;
