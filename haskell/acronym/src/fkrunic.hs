import Data.Char (isUpper, toUpper)

abbreviate :: String -> String
abbreviate xs = if all isUpper xs
                then xs
                else filter isUpper $ capitalize xs

capitalize :: String -> String
capitalize [] = []
capitalize (' ':c:cs) = toUpper c : capitalize cs
capitalize ('-':c:cs) = toUpper c : capitalize cs
capitalize (a:b:c:ds) = if all isUpper [a, b, c] then a : capitalize ds else a : capitalize (b:c:ds)
capitalize (c:cs) = c : capitalize cs

{-
    Assumes any letter after ' ' or '-' s/b capitalized. Only covers those cases.
    
    `if all isUpper [a, b, c]` is covering the 'GNU' case but 2 caps or 3 or more caps
      will be missed.
-}