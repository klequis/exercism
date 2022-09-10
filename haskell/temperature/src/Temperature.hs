module Temperature (tempToC, tempToF) where
import GHC.Float.RealFracMethods (truncateFloatInteger)

{- Implement the function `tempToC` to convert
`  Fahrenheit to Celsius                    -}
-- T(°C) = (T(°F) - 32) / 1.8.
tempToC :: Integer -> Float
tempToC temp = fromInteger (temp - 32) / 1.8


{- Implement the function `tempToF` to convert
`  Celsius to Fahrenheit                    -}
-- T(°F) = T(°C) × 1.8 + 32.
tempToF :: Float -> Integer
tempToF temp = ceiling (temp * 1.8 + 32)
