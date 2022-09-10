import Data.List (elemIndices, group, sort)
import Data.Char (toLower)

tstWd  = "listen"
tstWds = ["enlists", "google", "inlets", "banana"]

grpLtrs :: String -> [(Int, Char)]
grpLtrs str = makeTup . group $ sort str
  where makeTup = map (\xs -> (length xs, head xs))