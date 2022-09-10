module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

findMultiples :: Integral a => a -> a -> [a]
findMultiples limit x = [y | y <- nums, y `mod` x == 0]
  where nums = [0..(limit-1)]

mapMultiples :: Integral a => [a] -> a -> [[a]]
mapMultiples factors limit = map (findMultiples limit) factors

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ nub $ concat (mapMultiples filteredFactors limit)
  where filteredFactors = filter (/=0) factors


-- 3: 3, 6, 9, 12, 18
-- 5: 5, 10, 15

sumIt :: Integer
sumIt = sum [3,6,9,12,15,18,5,10,15]
-- sumIt = foldr (+) 0 [3,6,9,12,15,18,5,10,15]

test1 = concat (mapMultiples [3,5] 20)

test2 :: [Integer]
test2 = concat [[3,6,9,12,15,18],[5,10,15]]


test3 :: Integer
test3 = sum $ concat (mapMultiples [3,5] 20)