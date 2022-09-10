import Data.List (group, sort)
import Data.Char (toLower)

zipAndFilter :: [Bool] -> [a] -> [a]
zipAndFilter bs as = map snd filtered
  where
    zipped = zip bs as
    filtered = filter (\(x,y) -> x == True) zipped

groupLtrs :: String -> [(Int, Char)]
groupLtrs str = makeTup . group $ sort str
  where makeTup = map (\xs -> (length xs, head xs))



anagramsFor :: String -> [String] -> [String]
anagramsFor xs yss = zf
  where wd = map toLower xs
        wds = map (map toLower) yss
        grpWd = groupLtrs wd
        grpWds = map groupLtrs wds
        matches = map (==grpWd) grpWds
        zf = zipAndFilter matches wds


-- test wd wds = matches
--   where grpWd = groupLtrs wd
--         grpWds = map groupLtrs wds
--         matches = map (==grpWd) grpWds
--         -- zf = zipAndFilter matches wds

-- wd1  = "listen"
-- wds1 = ["enlists", "google", "inlets", "banana"]
-- a1 = ["inlets"]
-- t1 = anagramsFor wd1 wds1 == a1

-- wd2 = "diaper"
-- wds2 = [ "hello", "world", "zombies", "pants"]
-- a2 = []
-- t2 = anagramsFor wd2 wds2 == a2

-- wd3 = "master"
-- wds3 = ["stream", "pigeon", "maters"]
-- a3 = ["stream", "maters"]
-- t3 = anagramsFor wd3 wds3 == a3

-- wd4 = "Orchestra"
-- wds4 = ["cashregister", "Carthorse", "radishes"]
-- a4 = ["Carthorse"]
-- t4 = test wd4 wds4


