-- a specification of Adjacent_Find
with Types; use Types;
with Has_Equal_Neighbors_P; use Has_Equal_Neighbors_P;

package Adjacent_Find_P with
     Spark_Mode is

   function Adjacent_Find (A : T_Arr) return Option with
      Contract_Cases =>
      (Has_Equal_Neighbors (A) =>
         (Adjacent_Find'Result.Exists = True)
         and then
         (A (Adjacent_Find'Result.Value) = A (Adjacent_Find'Result.Value + 1))
         and then
         (not Has_Equal_Neighbors
            (A (A'First .. Adjacent_Find'Result.Value - 1))),
       others => Adjacent_Find'Result.Exists = False);

end Adjacent_Find_P;
