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


isValid :: [Char] -> Bool
isValid str
  | length noSpaceStr < 2 = False
  | otherwise = validateNum noSpaceStr
  where noSpaceStr = filter (not . isSpace) str