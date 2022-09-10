-- klequis
module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock {
    cHours :: Int
  , cMinutes :: Int
}  deriving Eq

padNum :: Int -> String -> String
padNum num numAsString = pad ++ numAsString
  where len = length numAsString
        pad = replicate (num - len) '0'

clockFromMinutes :: Int -> Clock
clockFromMinutes totalMinutes = Clock h m
  where m = mod totalMinutes 60
        h = mod (div totalMinutes 60) 24

fromHourMin :: Int -> Int -> Clock
fromHourMin hours mins = clockFromMinutes totalMins
  where totalMins = hours * 60 + mins

toString :: Clock -> String
toString (Clock hour minute) = concat [h, ":", m]
  where h = padNum 2 (show hour)
        m = padNum 2 (show minute)

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minutes (Clock cHour cMinute) = clockFromMinutes totalMinutes
  where clockMinutes = cHour * 60 + cMinute
        addMinutes   = hour * 60 + minutes
        totalMinutes = clockMinutes + addMinutes