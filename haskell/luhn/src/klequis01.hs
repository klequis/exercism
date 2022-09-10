-- klequis 01
module Luhn (isValid, ) where
import Data.Char (isSpace, digitToInt)

doubleNum :: (Int, Int) -> (Int, Int)
doubleNum (a,b)
  | mod a 2 == 1 =  if b*2 > 9
                    then (a,b*2 - 9)
                    else (a,b*2)
  | otherwise = (a,b)

validateNum :: [Char] -> Bool
validateNum str = a str `mod` 10 == 0
  where a = sum . map snd . zipWith (curry doubleNum) [(0 :: Int)..] . map digitToInt . reverse

isValid :: [Char] -> Bool
isValid str
  | length noSpaceStr < 2 = False
  | otherwise = validateNum noSpaceStr
  where noSpaceStr = filter (not . isSpace) str


-- a = reverse "123"

-- b = map digitToInt a



-- -- c :: [Char] -> [(Int, Int)]
-- c = mod 10 . sum . map snd . zipWith (curry doubleNum) [(0 :: Int)..] . map digitToInt . reverse

-- d = sum . map snd . zipWith (curry doubleNum) [(0 :: Int)..] . map digitToInt . reverse

-- ff = c "123"

-- validateNum :: [Char] -> Bool
-- validateNum str = f
--   where a = reverse str
--         b = map digitToInt a
--         c = zip [0..] b
--         d = map doubleNum c
--         e = map snd d
--         f = (sum e `mod` 10) == 0