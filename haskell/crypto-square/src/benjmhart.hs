import Data.Char
import Debug.Trace (trace, traceIO)

encode :: String -> String
encode [] = ""
encode xs
 | (length $ prepString xs) <= 1 = prepString xs
 | otherwise = unwords . transposeList $ makeSquared xs
          
transposeList :: [String] -> [String]
transposeList = foldl (rotateStrings) []

rotateStrings:: [String] -> String -> [String]
--first time
rotateStrings [] str = map (\y -> [y]) str
-- thereAfter
rotateStrings xs str = zipWith (appendChar) xs str
  where appendChar ws z = ws ++ [z] 

makeSquared :: String -> [String]
makeSquared xs = makeSquare dims [] $ prepString xs
  where dims = getDims xs

prepString :: String -> String
prepString = map toLower . filter (\y -> isNumber y || isLetter y) . concat . words
  
makeSquare :: (Int, Int) -> [String] -> String -> [String]
makeSquare (_, w) acc [] = (init acc) ++ [stretchRow w $ last acc]
makeSquare (h, w) acc xs = makeSquare (h, w) (acc ++ ([take w xs]))   (drop w xs)
        
stretchRow :: Int -> String -> String
stretchRow w ys
  | length ys == w = ys
  | length ys <  w = stretchRow w (ys ++ [' '])
  | otherwise      = ys

getDims :: String -> (Int, Int)
getDims xs = (y, x)
  where (x, y) = last [(c, r) | 
                 c <- [1..len], 
                 r <- [1..len], 
                 c>=r, 
                 (c-r) <= 1, 
                 (len `div` c) > r, 
                 (len `div` r) > c  ]
        len = length xs

-- interesting that I ignored the c >= r && (c-r) <= 1 rules as did the
-- other two solutions I reviewed.
-- Perhaps this the only correct solution.