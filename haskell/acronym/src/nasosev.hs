
import Data.Char (isAlpha, isLower, isUpper, toUpper)

abbreviate :: String -> String
abbreviate ys = toUpper <$> f "" ys
  where
    f xs (a : b : ys)
      | isUpper a && isAlpha b = f (xs ++ [a]) ys
      | a `elem` [' ', '-'] && isAlpha b = f (xs ++ [b]) ys
      | isLower a && isUpper b = f (xs ++ [b]) ys
      | otherwise = f xs (b : ys)
    f xs _ = xs

{-
    Interesting way of destructuring next n elements in a list `a : b : ys` is 
      the same as `x:xs` but just one more.
    Seems a little less robust than other solutions as `a `elem` [' ', '-']` is
      only filtering out two characters which works for the specific tests in
      this exercise but not other possibilities.
-}