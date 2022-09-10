-- syedareehaquasar
-- FAILED
module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock Int Int
  deriving Eq

makeHr :: Int -> Int
makeHr h | h < 0 = makeHr $ h + 24
         | h >= 24 = makeHr $ rem h 24
         | otherwise = h

makeMin :: Int -> Int
makeMin m | m < 0 = makeMin $ m + 60
          | m >= 60 = makeMin $ rem m 60
          | otherwise = m

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock (makeHr(hour + (div min 60))) (makeMin(min))

padWithZero :: String -> String
padWithZero s | length s == 1 = '0': s

toString :: Clock -> String
toString (Clock hours mins) = (padWithZero $ show hours) ++ ":" ++ (padWithZero $ show mins)

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min (Clock hours mins) = fromHourMin (hour + hours) (min + mins)