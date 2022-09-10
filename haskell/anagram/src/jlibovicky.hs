module Anagram ( anagramsFor ) where
import Data.List as List ( sort )
import Data.Char ( toLower )

stringToLower :: String -> String
stringToLower = map toLower 

anagramsFor :: String -> [String] -> [String]
anagramsFor word candidates =
   map (\(w, _) -> w) (filter (\(w, sortedW) -> sortedW == sortedWord) sortedCandidates)
    where
      lowerWord = stringToLower word
      sortedWord = List.sort lowerWord
      lowerCandidates = map stringToLower candidates
      differentCandidates = filter (\x -> x /= lowerWord) lowerCandidates
      sortedCandidates = zip candidates (map List.sort differentCandidates)

-- seems complicated