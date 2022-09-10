
tg1 :: String
tg1 = "G"

tg2 :: String
tg2 = "GCT"

tb1 :: String
tb1 = "GCBA"

-- isDNA :: Char -> Maybe Char
-- isDNA :: Char -> Either Char Char
-- isDNA c 
--   | c `elem` "GCTA" = Right c
--   | otherwise = Left c

notDNA c
  | c `elem` "GCTA" = Just c
  | otherwise = Nothing


-- mapit str = map DNA str



-- check G 
--   if good check C
--     if good check B
--       it's bad so return B

-- loop c x
--     | stopCondition x = observe x
--     | c > 0           = observe x >> iterateByA x >>= loop (c-1)
--     | stepCondition x = observe x >> iterateByA x >>= loop 9
--     | otherwise       = observe x >> iterateByB x >>= loop c

-- ALTERNATIVE STOPS ON THE FIRST ONE SO WHY ARENT YOU USING IT



main :: IO ()
main = do
  let a = mapit tg2
  print a
