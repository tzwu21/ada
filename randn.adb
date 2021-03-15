with ada.Text_IO; use Ada.Text_IO;
with ada.numerics.discrete_random;

function randN return Integer is
   type randRange is new Integer range 1 .. 10000;
   package Rand_Int is new ada.numerics.discrete_random(randRange);
   use Rand_Int;
   gen : Generator;
   num : randRange;
begin
   reset(gen);
   num := random(gen);
   return Integer (num);
end randN;