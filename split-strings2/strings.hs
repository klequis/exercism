import Data.Char (toUpper, isAlpha, isLower, isUpper)

keepChar :: (Char, String) -> Char -> (Char, String)
keepChar (l, xs) c
  | l =='\'' && c == 's'         = (c, xs)
  | not (isAlpha l) && isAlpha c = (c, xs ++ [toUpper c])
  | isLower l && isUpper c       = (c, xs ++ [c])
  | otherwise                    = (c, xs)

abbreviate :: String -> String
abbreviate = snd . foldl keepChar (' ', [])
                                  -- (' ', []) is the initial value :)



keepChar1 :: (Char, String) -> Char -> (Char, String)
keepChar1 (l, xs) c
  | l =='\'' && c == 's'         = (c, xs)
  | not (isAlpha l) && isAlpha c = (c, xs ++ [toUpper c])
  | isLower l && isUpper c       = (c, xs ++ [c])
  | otherwise                    = (c, xs)

abbreviate1 :: String -> String
abbreviate1 = snd . foldl keepChar(' ', [])

-- foldl                 (\acc c -> c : acc) "abcd" "efgh"

-- acc is always a function

-- foldl :: Foldable t => (b -> a -> b) -> b ->   t a -> b

-- foldl                  fn               start  [foldable]

-- foldl f z [x1, x2, ..., xn] == (...((z `f` x1) `f` x2) `f`...) `f` xn

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

a = foldl (+) 42 [1,2,3,4]

b = foldl (\acc c -> c : acc) "" "efgh"