module Anagram where
import Data.List
import Data.Char
anagramsFor :: String -> [String] -> [String]
anagramsFor a b = [x | x <- b, 
                          map toLower x /= a',
                          sort (map toLower x) == a''
                  ]
   where a' = map toLower a
         a'' = sort (map toLower a)


{-
    a' is wd passed in toLower
    a'' is wd passed in toLower & sorted
    -- he did two lower wtice there

    b is list of candidates
    (x <- b) is mapper for b
    x is represents each of the candiates in tern
    
    map toLower x /= a' compares the toLower x to a' -- exclude the same word

    sort (map toLower x) == a'' compares x sorted to a''
    
    Impression
    - could reduce occurance of toLower
    - hard to read 

-}