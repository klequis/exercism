import qualified Data.Map.Strict as Map
import Data.Map (update, fromList, mapWithKey)
import Data.Maybe (isNothing)

data Candidate = Candidate {
   value :: Integer
  ,isPrime :: Bool
  ,multiplesChecked :: Bool
} deriving Show

mkCandidates num = Map.fromList lst
  where lst = map (\x -> (x,Candidate {
                                        value = x
                                      , isPrime = True
                                      , multiplesChecked = x == 2
                                      })) [2..(2*num)]

getMultiples' :: Integer -> Integer -> Integer -> Integer -> [Integer]
getMultiples' cn maxNum cnt curMultiple
  | even maxNum && curMultiple >= maxNum = []
  | odd maxNum && curMultiple >= maxNum - 1 = []
  | otherwise = (cn * cnt) : getMultiples' cn maxNum (cnt+1) (cn * cnt)

currentKey = 2

getMultiples :: Integer -> Integer -> [Integer]
getMultiples candidateNum nthNum = getMultiples' candidateNum nthNum currentKey 0

-- mkFalse mp multiples = 

theMap = mkCandidates 13
bb = Map.lookup 3 theMap

theMultiples = getMultiples 2 15
-- [4,6,8,10,12,14]


isNotPrime :: Candidate -> Maybe Candidate
isNotPrime (Candidate a isPrime c) = Just (Candidate a isPrime c)

updateMultiples :: [Map.Map Integer Candidate]
updateMultiples = map (\x -> update isNotPrime x theMap) theMultiples

-- -------------------------------------------






-- untilTrue :: [Bool] -> Int -> Int
-- untilTrue [] cnt = -1
-- untilTrue (x:xs) cnt
--   | x = cnt
--   | otherwise = untilTrue xs (cnt+1)

untilTrue :: [Bool] -> Int -> Maybe Int
untilTrue [] cnt = Nothing
untilTrue (x:xs) cnt
  | x = Just cnt
  | otherwise = untilTrue xs (cnt+1)

v :: Maybe Int
v = untilTrue [False,True,False,False] 0

untilTrue2 :: [Bool] -> Maybe Int
untilTrue2 xs = go xs 0
  where go [] _ = Nothing
        go (y:ys) cnt
          | y = Just cnt
          | otherwise = go ys (cnt+1)

w :: Maybe Int
w = untilTrue2 [False,True,False,False]

xx :: Maybe Int
xx = untilTrue2 [False,False,False,False]


tv1 = [  Candidate {value = 2, isPrime = True, multiplesChecked = True}
       , Candidate {value = 3, isPrime = True, multiplesChecked = False}
       , Candidate {value = 4, isPrime = False, multiplesChecked = False}
       , Candidate {value = 5, isPrime = False, multiplesChecked = False}
      ]

candidateIsPrime :: Candidate -> Bool
candidateIsPrime (Candidate _ prime _) = prime

untilIsPrime :: [Candidate] -> Maybe Candidate
untilIsPrime xs = go xs (0 :: Int)
  where go [] _ = Nothing
        go (y:ys) cnt
          | candidateIsPrime y = Just y
          | otherwise = go ys (cnt+1)

untilIsPrime2 :: [Candidate] -> Maybe Candidate
untilIsPrime2 [] = Nothing
untilIsPrime2 xs = go xs (0 :: Int)
  where go [] _ = Nothing
        go [Candidate a b c] _ = if b then Just (Candidate a b c) else Nothing
        go (x:y:ys) cnt
          | candidateIsPrime x && not (candidateIsPrime y) = Just x
          | otherwise = go (y:ys) (cnt+1)


mmm = untilIsPrime2 tv1

-- -------------------------------------------
-- -------------------------------------------
-- getNextPrime True _ = 
-- getNextPrime key = getNextPrime
-- lookup name employeeDept

-- fn3 :: Int -> Maybe Int
-- fn3 x = Just (x*2)

-- f :: Map.Map Integer Int
-- f = update fn3 5 (fromList [(5,1), (3,2)])

-- fn4 :: Candidate -> Maybe Candidate
-- fn4 (Candidate a b c) = Just (Candidate 99 False False)

-- updateEx :: Map.Map Integer Candidate
-- updateEx = update fn4 3 theMap






