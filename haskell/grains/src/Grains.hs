module Grains (square, total) where
import Data.Maybe (fromJust)

square :: Integer -> Maybe Integer
square n =  if n < 1 || n > 64
            then Nothing
            else Just (2^(n-1))

-- do it with fromJust
total :: Integer
total = sum [fromJust y | x <- [1 .. 64], let y = square x]

-- using lambda
total1 :: Integer
total1 = sum [y | x <- [1..64], let y = (\(Just z) -> z)(square x)]

-- 1 = 1
-- 2 = 2
-- 3 = 4
-- each is double the previous

-- a :: [Integer]
-- a = [1..64]

-- 3 = 4
-- 4 = 8

-- 3 * x == 4 (1.5)
-- 4 * x == 8 (2)

-- square
-- 3 + 1  =  4
-- 4 + 2  =  8 (1)
-- 5 + 11 = 16 (9)   (8)
-- 6 + 26 = 32 (15)  (6)
-- 7 + 57 = 64 (41) (26)
