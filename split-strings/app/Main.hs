{-# LANGUAGE OverloadedStrings #-}
import Data.List (intercalate)
import Data.Text (replace)
import Data.Char (isSpace, isUpper, isAlpha, isLower)
import Data.Maybe (mapMaybe, catMaybes)

idxChk idx str
  | idx < 0 = False
  | idx > (length str) - 1 = False
  | otherwise = True
  
-- get the start: take i+1 str
insertPipe :: Int -> String -> String
insertPipe after str =  if idxChk after str
                        then concat [left, "|", right]
                        else str
  where idx = after + 1
        left = take idx str
        right = drop idx str

alpha :: Maybe Char -> Bool
alpha (Just x) = isAlpha x
alpha _        = False

lower :: Maybe Char -> Bool
lower (Just x) = isLower x
lower _        = False

upper :: Maybe Char -> Bool
upper (Just x) = isUpper x
upper _        = False

findCamelCase :: Int -> String -> String
findCamelCase idx str
  | alpha curr && lower curr && alpha next && upper next = insertPipe idx str
  | otherwise = str
  where prev = if idx-1 < 0 then Nothing else Just (str !! (idx-1))
        curr = Just (str !! idx)
        next = if idx+1 > length str then Nothing else Just (str !! (idx+1))


-- callit :: String -> String
-- callit str = findCamelCase x str
--   where x = head [0..len]
--         len = length str

callit :: String -> String
callit str = [(findCamelCase x str) | x <- [0..length str]]
 

-- replaceHyphen :: p -> [Char] -> [Char]
replaceHyphen :: [Char] -> [Char]
replaceHyphen = map (\x -> if x == '-' then '|' else x)

-- removePunctuation str = map (x -> if isPunctuation x then remove)

replaceChars' :: Char -> Maybe Char
replaceChars' c
  | ch == 39 = Nothing
  | ch == 32 = Just '|'
  | ch == 44 = Nothing
  | ch == 45 = Just '|'
  | ch == 95 = Nothing
  | otherwise = Just c
  where ch = fromEnum c

toMaybe :: String -> String
toMaybe str = mapMaybe  replaceChars' str

-- replaceChars :: [[Char]]
-- replaceChars = map (mapMaybe replaceChars')
-- replaceChars :: String -> String
-- replaceChars str = map (mapMaybe replaceChars') str

-- map [0..length "abc" - 1] "abc"



main :: IO ()
main = do
  let a = toMaybe case1
  let b = replaceHyphen a
  
  --let c = map findCamelCase () b
  print b

{- special cases
    -- metal-oxide
    -- HyperText
    -- something - I made
    -- Road _Not_ Taken
-}
{-
     
               a b c d e - length = 5
    insert at: 0 1 2 3 4
         take: 1 2 3 4 5

    if after < 0 || after > len-1 then str
    if after < 0 then str
-}
-- -----------------------------------------------------------------

-- fn4 cur prev next
--   | isUpper cur && isUpper next = concat [prev, cur, '|' next] -- [A] HyperText
--   | cur == '-' isAlphaNum next = concat [prev, ' ', next]  -- [B] metal-oxide

-- fn4 cur prev next
--   | isUpper cur && isUpper next = concat [prev, cur, '|' next] -- [A] HyperText

fn3 :: Char -> Char -> Char -> Maybe Char
fn3 cur prev next 
  | curInt == 39 = Nothing
  | curInt == 32 = Just '|'
  | curInt == 44 = Nothing
  | curInt == 45 = Just '|'
  | curInt == 95 = Nothing
  | otherwise    = Just cur
  where curInt = fromEnum cur :: Int

fnTmp :: Char -> Char -> Char -> [Char]
fnTmp prev cur next = intercalate "|" [[prev],[cur],[next]]

fnTmp2 :: String -> Char -> Char -> Char -> String
fnTmp2 str p c n = intercalate "|" [[p],[c],[n]]

foldr k z = go
      where
         go []     = z
         go (y:ys) = y `k` go ys

genIdx x = x

send3' :: String -> Int -> Int -> Int -> String
send3' str idxP idxC idxN = fnTmp prev cur next
  where prev = str !! idxP
        cur  = str !! idxC
        next = str !! idxN

txt :: String
txt = "tal-oxi"

-- a = fnTmp (txt !! 0) (txt !! 1) (txt !! 2)
-- b = fnTmp (txt !! 1) (txt !! 2) (txt !! 3)
-- c = fnTmp (txt !! 2) (txt !! 3) (txt !! 4)
-- d = fnTmp (txt !! 3) (txt !! 4) (txt !! 5)
-- e = fnTmp (txt !! 4) (txt !! 5) (txt !! 6)


-- send3 :: String -> String
-- send3 str = send3' str -1 0 1

-- send3 str = go str -1 0 1
--   where go str p c n = c : fnTmp prev cur next : go str (p+1) (c+1) (n+1)
--           where prev = str !! p
--                 cur  = str !! c
--                 next = str !! n



{- maybe
    take 5 $ foldr (\i acc -> i : fmap (+3) acc) [] (repeat 1)

    mapAccumL: The mapAccumL function behaves like a combination of fmap and foldl; 
      it applies a function to each element of a structure, passing an accumulating 
      parameter from left to right, and returning a final value of this accumulator 
      together with the new structure.
      > mapAccumL (\a b -> (a <> show b, a)) "0" [1..5]
      ("012345",["0","01","012","0123","01234"])

    > span (< 3) [1,2,3,4,1,2,3,4]
    ([1,2],[3,4,1,2,3,4])
-}


-- process :: Char -> Maybe Char
-- process c
--   | ch == 39 = Nothing
--   | ch == 32 = Just '|'
--   | ch == 44 = Nothing
--   | ch == 45 = Just '|'
--   | ch == 95 = Nothing
--   | otherwise = Just c
--   where ch = fromEnum c

-- cur

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

