-- wordhou

import Data.Char (toLower, isAlphaNum)
import Data.List (transpose, unfoldr)

encode :: String -> String
encode = unwords . pad . transpose . split . normalize where
  normalize = map toLower . filter isAlphaNum
  split xs = takeWhile (not . null) $ unfoldr (Just . splitAt c) xs
    where c = ceiling $ sqrt $ fromIntegral $ length xs
  pad xs = map (take l . (++ " ")) xs
    where l = length $ head xs

-- uses head of xs as length to use for pad
-- uses isAlphaNum instead of (isPunctuation & isSpace) as I did
-- composes nicely in forst term level line *
-- uses splitAt (length of head) xs to split up normalized string