-- module Anagram (anagramsFor) where
import Data.List (elemIndices, group, sort)
import Data.Char (toLower)

tstWd  = "listen"
tstWds = ["enlists", "google", "inlets", "banana"]
tstWdsAnswer = ["inlets"]

hasAllLetters :: String -> String -> Bool
hasAllLetters strX strY = all ((==True) . (`elem` xs)) ys
  where xs = map toLower strX
        ys = map toLower strY

-- isSameLength :: String -> String -> Bool
-- isSameLength xs ys = length xs == length ys

-- fn' :: String -> String -> Bool
-- fn' xs ys = xs /= ys && hasAllLetters xs ys && isSameLength xs ys

t1 = ["cashregister", "carthorse", "radishes"]

canMkWd :: String -> String -> Bool
canMkWd xs ys = all (==True) [notEqual, allLtrs]
  where notEqual = xs /= ys
        allLtrs = hasAllLetters xs ys
        -- sameLen = length xs == length ys

gtt1 = ['a', 'b',  'c']
gtt2 = [True,False,False]
gttT = getTrueTups gtt1 gtt2 == [('a',True)]
getTrueTups :: [a] -> [Bool] -> [(a,Bool)]
getTrueTups xs ys = b
  where a = zip xs ys
        b = filter (\(_,x) -> x) a




grpLtrs :: p -> [(Int, Char)]
grpLtrs str = makeTup . group $ sort "patter"
  where makeTup = map (\xs -> (length xs, head xs))



matchLtrCnt :: String -> [String] -> [String]
matchLtrCnt xs yss = t
  where xsGrouped = grpLtrs yss -- [(Int,Char)] is [(count, ltr)]
        yssGrouped = map grpLtrs yss
        t = map  (== xsGrouped) yssGrouped

anagramsFor :: String -> [String] -> [String]
anagramsFor xs yss = map snd truePairs
  where canMk = map (canMkWd xs) yss                         -- [Bool]
        idxs = elemIndices True canMk                    -- [Int]
        pairs = zip [0..] yss                              -- [(Int,String)]
        truePairs = filter (\(x,_) -> x `elem` idxs) pairs -- [(Int,String)]
        justWds = map snd truePairs
        ltrsMatch = matchLtrCnt xs justWds


letterCountMatches :: String -> [String] -> [String]
-- grpXsLtrs
-- grpYssLtrs


canMakeWords :: String -> [String] -> [String]





{-
    ['a', 'b',  'c']
    [True,False,False]
-}

{-
    - str
    - canMakeWord
    - ltrsMatch
    - 

    [String,String,String]
    [(Int,String),(Int,String),(Int,String)]    -- [(ord, word)]
    [(Int,String),(Int,String)]                 -- [(ord, word)]
    [String,String]                             -- [word]          ** only the gd 1s
    String, [String,String] -> [(String,True)]  -- [(word, true)]

-}




{-
    xss & yss: String -> [[String]]
        canMk: [Bool]
         idxs: [Int]
         pairs: [(Int,String)]
         truePiars: [(Int,String)]
         ltrsMatch: [Bool]



         return: [String]
-}




-- test1 = fn "master" ["stream", "pigeon", "maters"] -- ["stream", "maters"]

-- p = map (`elemIndices` "trapper") "patter"
makeTup = map (\xs -> (length xs, head xs))

grp1 = makeTup . group $ sort "patter"
grp2 = makeTup . group $ sort "trapper"

-- tup1 = [(1,'a'),(1,'e'),(1,'p'),(1,'r'),(2,'t')]

-- tup2 = [(1,'a'),(1,'e'),(2,'p'),(2,'r'),(1,'t')]



match = [fst x == fst y | x <- tup1, y <- tup2]

-- matchLtrCnt wd1 wd2 = all (==True) x
--   where map 

-- a = [x == y | x <- tup1, y <- tup2]

-- tupsEq' :: Eq a => [a] -> [a] -> Bool
-- tupsEq' (x:xs) (y:ys) = if x == y then tupsEq xs ys else False
-- -- tupsEq' [] [] = True
-- -- tupsEq' _ [] = False
-- -- tupsEq' [] _ = False


-- tupsEq :: Eq a => [a] -> [a] -> Bool
-- tupsEq xs ys = not (length xs /= length ys) && tupsEq' xs ys

-- zzz :: [(Int,Char)] -> [(Int,Char)] -> Bool
-- zzz xs ys = do
--   x <- xs
--   y <- ys
--   return Just (x == y)

tup1 :: [(Integer, Char)]
tup1 = [(1,'a'),(1,'e'),(1,'p'),(1,'r'),(2,'t')]

tup2 :: [(Integer, Char)]
tup2 = [(1,'a'),(1,'e'),(2,'p'),(2,'r'),(1,'t')]
tup3 = [(1,'a'),(1,'e'),(1,'p'),(1,'r'),(2,'t')]
tup4 = [(1,'a'),(1,'e'),(1,'p'),(1,'r'),(2,'t'),(2,'t')]



-- Couldn't match expected type ‘m b’ with actual type ‘Bool’
-- In a stmt of a 'do' block: return x == y
{-
    are the lengths the same? - maybe not worth it
    Do they have the same count of each letter?
      - they need to be exact
    fns
    - lookup
-}