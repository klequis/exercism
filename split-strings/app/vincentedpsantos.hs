import Data.Char (toUpper, isAlpha, isLower, isUpper)

keepChar :: (Char, String) -> Char -> (Char, String)
keepChar (l, xs) c
  | l =='\'' && c == 's'         = (c, xs)
  | not (isAlpha l) && isAlpha c = (c, xs ++ [toUpper c])
  | isLower l && isUpper c       = (c, xs ++ [c])
  | otherwise                    = (c, xs)

abbreviate :: String -> String
abbreviate = snd . foldl keepChar(' ', [])



keepChar1 :: (Char, String) -> Char -> (Char, String)
keepChar1 (l, xs) c
  | l =='\'' && c == 's'         = (c, xs)
  | not (isAlpha l) && isAlpha c = (c, xs ++ [toUpper c])
  | isLower l && isUpper c       = (c, xs ++ [c])
  | otherwise                    = (c, xs)

abbreviate1 :: String -> String
abbreviate1 = snd . foldl keepChar(' ', []) "Something - I made up from thin air"

-- foldl                 (\acc c -> c : acc) "abcd" "efgh"

-- acc is always a function

-- foldl :: Foldable t => (b -> a -> b) -> b ->   t a -> b

-- foldl                  fn               start  [foldable]

-- foldl f z [x1, x2, ..., xn] == (...((z `f` x1) `f` x2) `f`...) `f` xn
