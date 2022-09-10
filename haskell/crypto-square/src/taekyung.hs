import Data.Char
import Data.List (transpose, intersperse)

encode :: String -> String
encode = concat . intersperse " " . transpose . rectangle . normalize

normalize :: String -> String
normalize = map toLower . filter (isAlphaNum)

rectangle :: String -> [String]
rectangle xs =
  let len = length xs
      floorSqrtLen = floor . sqrt $ (fromIntegral len :: Double)
      c | floorSqrtLen^(2::Int) == len = floorSqrtLen
        | otherwise                    = floorSqrtLen + 1

      split :: String -> [String]
      split "" = []
      split ys = (pre ++ (replicate (c - length pre) ' ')) : split remain
        where oneStep = splitAt c ys
              pre = fst oneStep
              remain = snd oneStep
  in  split xs

-- OK. 
-- Seems a bit long but still shorter than my original solution.
-- The let .. in structure is uncomfortable for me.