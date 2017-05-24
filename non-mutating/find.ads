-- a better specification of Find using the Has_Value function

with Types; use Types;
with Has_Value;

package Find with
     Spark_Mode is

   function Find (A : T_Arr; Val : T) return Option with
      Contract_Cases =>
      (Has_Value.Has_Value (A, Val) =>
         (Find'Result.Exists = True)
         and then (A (Find'Result.Value) = Val)
         and then
         (not Has_Value.Has_Value (A (A'First .. Find'Result.Value - 1), Val)),
       others => Find'Result.Exists = False);

end Find;
