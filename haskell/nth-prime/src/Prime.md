getNextPrime

iterate over the Map
start with currentKey 2
check 
   a = Map.lookup 3 m
   


---

-- Any multiple of a prime number can't be prime
-- it will have more than two divisors
-- disqualifying it as a prime number

{-
      fn nth tups = stop
      fn len tups
-}

{-
    do while gg < = 13
      test 3
      createTups 3

-}

-- when length . filter snd [] == goal then done
-- ------------------------------------------
-- find the 1st prime number
-- find the first 1 primes
p1 = [(True,2),(True,3),(True,4),(True,5),(True,6),(True,8),(True,9),(True,10),(True,11),(True,12),(True,13)]
{-
    2 x 2 = 4
    2 x 3 = 6
    2 x 4 = 8
    2 x 5 = 10
    2 x 6 = 12
-}

-- ------------------------------------------
-- ------------------------------------------
-- ------------------------------------------
-- find the 5th prime number
-- find the first 5 primes
-- n == 5
a :: [(Bool, Integer)]
a = [(True,2),(True,3),(True,4),(True,5),(True,6),(True,7),(True,8),(True,9),(True,10),(True,11),(True,12),(True,13)]

{-
   
   2 x 2 = 4
   2 x 3 = 6
   2 x 4 = 8
   2 x 5 = 10
   2 x 6 = 12

-}
b :: [(Bool, Integer)]
b = [(True,2),(True,3),(False,4),(True,5),(False,6),(True,7),(False,8),(True,9),(False,10),(True,11),(False,12),(True,13)]

{-
   3 x 2 = 6
   3 x 3 = 9
   3 x 4 = 12
-}
c :: [(Bool, Integer)]
c = [(True,2),(True,3),(False,4),(True,5),(False,6),(True,7),(False,8),(False,9),(False,10),(True,11),(False,12),(True,13)]

{-
   5 x 2 = 10
-}
d :: [(Bool, Integer)]
d = [(True,2),(True,3),(False,4),(True,5),(False,6),(True,7),(False,8),(False,9),(False,10),(True,11),(False,12),(True,13)]

e :: [(Bool, Integer)]
e = filter fst d