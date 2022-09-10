-- FranciscoThiesen
module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock
  { clockHour :: Int
  , clockMinute :: Int 
  }
  deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = minutesToClock $ hour * 60 + min

getTime :: Int -> String
getTime x
  | x < 10 = "0" ++ show x
  | otherwise = show x

toString :: Clock -> String
toString clock = (getTime $ clockHour clock) ++ ":" ++ (getTime $ clockMinute clock)

clockToMinutes :: Clock -> Int
clockToMinutes clock = (clockHour clock) * 60 + clockMinute clock

bringBackToBasis :: Int -> Int
bringBackToBasis x = x `mod` 1440

minutesToClock :: Int -> Clock
minutesToClock x = Clock (mod (div x 60) 24) (mod x 60)

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock = minutesToClock $ bringBackToBasis $ hour * 60 + min + clockToMinutes clock