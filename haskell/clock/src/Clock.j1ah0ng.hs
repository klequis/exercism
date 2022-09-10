-- j1ah0ng
module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock { minutes :: Int }

instance Eq Clock where
    x == y = minutes x == minutes y

hr :: Clock -> Int
hr c = minutes c `div` 60

mn :: Clock -> Int
mn c = minutes c `mod` 60

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock ( (60 * hour + min) `mod` 1440 )

toString :: Clock -> String
toString clock 
  | minutes clock == 1440 = "00:00"
  | otherwise = do
    let h = hr clock
    let m = mn clock
    let a = if h < 10 then concat ["0", show h] else show h
    if m < 10 then concat [a, ":", "0", show m] else concat [a, ":", show m]

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock = 
    Clock ( (60 * hour + min + minutes clock) `mod` 1440 )