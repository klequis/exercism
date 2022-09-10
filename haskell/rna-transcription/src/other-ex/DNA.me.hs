-- module DNA (toRNA) where


-- validateDnaChars = all (==True) (map isDNA "GCTA")

-- find the first letter that is not in "GCTA"
{-# OPTIONS_GHC -Wno-unused-top-binds #-}

tg1 :: String
tg1 = "G"

tg2 :: String
tg2 = "GCT"

tb1 :: String
tb1 = "GCBA"


testit :: [Char] -> [Char]
testit [] = []
testit (x:xs) = if not (isDNA x) then [x] else x : testit xs
  where isDNA = (`elem` "GCTA")

testit2 (x:xs)
  | (isDNA x) = x : testit2 xs
  | otherwise  = [x]
  where isDNA = (`elem` "GCTA")

-- toRNA :: String -> Either Char String
-- toRNA xs = 
--   where isValidChar = 

-- get a string
-- fist char that is not GCTA return char
-- if all are GCTA then return dnaToRna

-- bla str = 
--   where allValid = map ()


dnaToRna :: Char -> Char
dnaToRna c 
  | c == 'G' = 'C'
  | c == 'C' = 'G'
  | c == 'T' = 'A'
  | c == 'A' = 'U'
  | otherwise = c

-- convert :: String -> String
convert :: [Char] -> [Char]
convert str = map dnaToRna str

main :: IO ()
main = do
  -- let x = map dnaToRna "GCTA"
  let x = convert "GCTA"
  print x
  let y = convert "G"
  print y
  let z = convert ""
  print z