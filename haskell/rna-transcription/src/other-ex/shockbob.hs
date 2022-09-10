-- https://github.com/shockbob/more-exercism-solutions/blob/f102fb97ff62da5168f30c8af073155f58886bdf/haskell/rna-transcription/src/DNA.hs

import Data.Maybe
import Data.List(find,head)

dnaToRna :: Char -> Maybe Char
dnaToRna n | n=='G'=Just 'C'
           | n=='C'=Just 'G'
           | n=='T'=Just 'A'
           | n=='A'=Just 'U'
           | otherwise = Nothing 

toRNA :: String -> Either Char String
toRNA xs | isJust badDna = Left (fromJust badDna)
         | otherwise = Right (map (fromJust . dnaToRna) xs) 
         where badDna = find (isNothing . dnaToRna)  xs

{-
    This looks like the function only runs once.
    If test one fails it runs test two which is a pretty straight
    forward map

    - I didn't think to use `find` but I guess `elem` works as well
    - `fromJust`: The fromJust function extracts the element out 
      of a Just and throws an error if its argument is Nothing.
    - `isJust`: The isJust function returns True iff its argument 
      is of the form Just _
-}