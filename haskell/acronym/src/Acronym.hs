{-# LANGUAGE OverloadedStrings #-}
{-
    - partition

-}

module Acronym (abbreviate) where
import qualified Data.Text as T
import           Data.Text (Text)
import           Data.Char (toUpper, isPunctuation)
import Data.Maybe (mapMaybe, catMaybes)
import Data.Bits (Bits(xor))

abbreviate :: String -> String
abbreviate xs = upper
  where wds = words xs
        firstLetters = map (take 1) wds
        concatLetters = concat firstLetters
        upper = map toUpper concatLetters

-- process acc val
--   | 

-- processEachChar str = map process str

-- processChars str = foldl process [] str

-- modPunctuation = 
-- send me a Char
-- if it is punctuation I will tell you what to do with it

-- data PunctuationAction = Split | Remove | Break | None Char
--   deriving (Show, Eq)

-- data CharType = 

-- punctuationAction :: Char -> PunctuationAction
-- punctuationAction c
--   | c == '-' = Split
--   | c == '\'' = Remove


-- dd1 c = if isPunctuation c then Just c else Nothing

-- dd2 c = if isPunctuation c then punctuationAction c else None c


-- cc = map dd2 "Complementary metal-oxide semiconductor"




-- mapMaybe


-- T.unpack $ T.toUpper $ T.concat firstLetters

-- tryit "Ruby on Rails" = "ROR"
-- tryit :: Text -> Text
-- tryit xs = T.map T.head wds
--   where wds = T.toUpper words xs

-- m :: ([Char], [Char])
-- m = break (=='T') "HTML"
-- n = map (break (=='M')) m

-- a = abbreviate "Ruby on Rails" -- == "ROR" -- works

-- t1 :: Text
-- t1 = "hello"

-- t2 :: Text
-- t2 = "bye"

-- b :: Char
-- b = T.head t1 -- T.head returns a Char :(

-- c :: Text
-- c = T.pack [T.head t1] -- works but messy

-- t3 :: [Text]
-- t3 = [t1,t2]

-- -- d = T.map (\x -> T.head x) ["hello","bye"]

-- -- let message = pack "I am not angry. Not at all."
-- -- T.map (\c -> if c == '.' then '!' else c) message
-- -- "I am not angry! Not at all!"

-- -- firstLetter :: Text -> Text
-- -- e = T.take 1

-- -- f :: [Text]
-- -- f = map T.take 1 ["hello","bye"]

-- -- g = T.toUpper $ T.concat f
toCode :: String -> [Int]
toCode str = map fromEnum str

toChars :: [Int] -> String
toChars xs = map (\x -> toEnum (x :: Int)) xs

aa = toCode case9

bb = toChars aa == case9



case1 :: String
case1       = "Portable Network Graphics"
case2 :: String
case2       = "Ruby on Rails"
case3 :: String
case3       = "HyperText Markup Language"
case4 :: String
case4       = "First In, First Out"
case5 :: String
case5       = "GNU Image Manipulation Program"
case6 :: String
case6       = "Complementary metal-oxide semiconductor"
case7 :: String
case7       = "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"
case8 :: String
case8       = "Something - I made up from thin air"
case9 :: String
case9       = "Halley's Comet"
case10 :: String
case10       = "The Road _Not_ Taken"

cases = [case1,case2,case3,case4,case5,case6,case7,case8,case9,case10]


{-
    '     == 39
    space == 32
    ,     == 44
    -     == 45
    _     == 95
-}

process :: Char -> Maybe Char
process c
  | ch == 39 = Nothing
  | ch == 32 = Just '|'
  | ch == 44 = Nothing
  | ch == 45 = Just '|'
  | ch == 95 = Nothing
  | otherwise = Just c
  where ch = fromEnum c
-- cc = map process [x | x <- cases]
-- dd = map process
cc = map (mapMaybe process) cases



dd = [
  "Portable|Network|Graphics",
  "Ruby|on|Rails",
  "HyperText|Markup|Language", -- **
  "First|In|First|Out",
  "GNU|Image|Manipulation|Program", -- **
  "Complementary|metal-oxide|semiconductor", -- **
  "Rolling|On|The|Floor|Laughing|So|Hard|That|My|Dogs|Came|Over|And|Licked|Me",
  "Something|-|I|made|up|from|thin|air", -- **
  "Halleys|Comet",
  "The|Road|Not|Taken"]

-- split on pipe
-- findCamelCase



breakOnPipe :: [Char] -> ([Char], [Char])
breakOnPipe = break (=='|')

ff :: [([Char], [Char])]
ff = map breakOnPipe dd

zz = scanr1 (||) [True, True, False, False]
-- [True,True,False,False]

ccc :: Char -> Char -> Char
ccc x y
  | x == 'a' = 'b'
  | x == 'b' = 'c'
  | x == 'c' = 'd'
  | otherwise = 'z'
-- yy = scanr1 (Char -> Char -> Char) Text
yy = scanr1 ccc "abcd"

s0 = scanl (+) 0 [1,2,3,4]
-- [0,1,3,6,10]

{-
    "Portable|Network|Graphics"
    - p o r -> p o
    - p (o) r  -> 
-}