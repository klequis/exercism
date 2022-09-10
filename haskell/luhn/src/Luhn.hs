module Luhn (isValid, ) where
import Data.Char (isSpace, digitToInt)

doubleNumIfOdd :: Int -> Int -> Int
doubleNumIfOdd a b
  | mod a 2 == 1 =  if b*2 > 9
                    then b*2 - 9
                    else b*2
  | otherwise = b

validateNum :: [Char] -> Bool
validateNum str = a str `mod` 10 == 0
  where a = sum
          . zipWith doubleNumIfOdd   [(0 :: Int)..]
          . map digitToInt . reverse





-- a1 ::  [(Integer -> Integer, Integer)]
a1 = zip [(+ 1), (* 2)] [2, 7]

-- b1 :: [b] -> [c]
-- b1 = zipWith \x y -> [(+ 1), (* 2)] [2, 7]



-- a :: [(Integer -> Integer, Integer)]
-- a = zipWith ((+ 1), (* 2)) [2,7]

-- b = zip [(*1)]

-- -- c :: [b] -> [(Integer -> Integer, b)]
-- -- c :: [(Integer -> Integer, Integer)]

-- c :: [(Integer -> Integer, (Integer, Integer))]
-- c = zip [(+ 1), (* 2)] [(1,2),(3,4)]

isValid :: [Char] -> Bool
isValid str
  | length noSpaceStr < 2 = False
  | otherwise = validateNum noSpaceStr
  where noSpaceStr = filter (not . isSpace) str


-- fn1 :: String -> String
-- fn1 str = reverse str

-- fn2 :: String -> [Int]
-- fn2 = map digitToInt . fn1

-- fn3 :: String -> [Int]
-- fn3 = zipWith doubleNumIfOdd   [(0 :: Int)..] . fn2
-- --            (a -> b -> c) -> [a] ->           [b] -> [c]

-- fn4 :: String -> Int
-- fn4 = sum . fn3

-- oneLine :: String -> Int
-- oneLine = sum . zipWith doubleNumIfOdd   [(0 :: Int)..] . map digitToInt . reverse

{-
    I had wondered why I needed `curry` in `zipwith (curry doubleNum)`. I think I didn't see
    the signature of `zipWith` properly.

-}


-- map f (map g xs) == map (f . g) xs

-- maybe using `map (+)` instead of sum would work

-- fgh = sum (zipWith doubleNumIfOdd   [(0 :: Int)..]) 



-- validateNum =
--       reverse
--   >>> map digitToInt
--   >>> zip [0..]
--   >>> map (doubleNum . snd)
--   >>> sum
--   >>> (`mod` 10)
--   >>> (== 0)


















