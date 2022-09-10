module Anagram (anagramsFor) where

import Data.List (sort)
import Data.Char (toLower)

anagramsFor :: [Char] -> [[Char]] -> [[Char]]
anagramsFor a = filter (anagram a)

anagram :: [Char] -> [Char] -> Bool
anagram a' b' = a /= b && sort a == sort b
    where
        a = map toLower a'
        b = map toLower b'