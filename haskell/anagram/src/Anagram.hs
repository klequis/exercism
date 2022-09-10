module Anagram (anagramsFor) where
import Data.List (sort)
import Data.Char (toLower)

wdToLower :: [Char] -> [Char]
wdToLower wd = map toLower wd

anagramsFor :: String -> [String] -> [String]
anagramsFor wd wds = notSameWd
  where wdLower = wdToLower wd
        wdLowerSorted = sort wdLower
        ltrsMatch = filter (\x -> wdLowerSorted == sort (wdToLower x)) wds
        notSameWd = filter (\x -> wdToLower x /= wdLower) ltrsMatch




