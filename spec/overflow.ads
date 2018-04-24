with Types; use Types;

package Overflow with
     Spark_Mode is

   function Add_No_Overflow
     (X, Y : T) return Boolean is
     (Y = 0
      or else (Y > 0 and then T'Last - Y >= X)
     or else (Y < 0 and then T'First - Y <= X))
   with Ghost;

--     function Multiply_No_Overflow
--       (X, Y : T) return Boolean is
--       ((Y = 0 or Y = 1)
--        or else (Y = -1 and then Integer (X) > Integer'First and then -X in T)
--        or else (Y > 1 and then X <= T'Last / Y and then T'First / Y <= X)
--        or else
--        (Y < -1
--         and then Integer (Y) /= Integer'First
--         and then T'Last / Y <= X
--         and then X <= T'First / Y)
--        or else
--        (Integer (Y) = Integer'First and then (X = 0 or X = 1))) with
--        Contract_Cases =>
--        ((X * Y in T) => Multiply_No_Overflow'Result = True,
--         others       => Multiply_No_Overflow'Result = False);


   function Multiply_No_Overflow
     (X, Y : T) return Boolean
     with
       Ghost,
       Contract_Cases =>
         ((X * Y in T) => Multiply_No_Overflow'Result = True,
          others       => Multiply_No_Overflow'Result = False);

end Overflow;
