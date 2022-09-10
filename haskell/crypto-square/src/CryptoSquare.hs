module CryptoSquare (encode) where
import Data.List (transpose)
import Data.Char (isPunctuation, isSpace, toLower)

lengthAsIntegral :: (Num b, Foldable t) => t a -> b
lengthAsIntegral str = fromIntegral (length str)

makeChunks :: Int -> String -> [String]
makeChunks _ [] = []
makeChunks num str = take num str : makeChunks num (drop num str)

calcLength :: String -> Double
calcLength "" = 0
calcLength str = sqrt (lengthAsIntegral str :: Double)

pad :: Int -> String -> String
pad len x = x ++ replicate (len - lengthAsIntegral x) ' '

normalize :: String -> String
normalize = map toLower . filter (\x -> not (isPunctuation x) && not (isSpace x))
-- could use isAlphaNum

encode :: String -> String
encode str = unwords transposed
  where
    norm = normalize str
    len = calcLength norm
    cols = ceiling len :: Int
    chunks = makeChunks cols norm
    padded = map (pad cols) chunks
    transposed = transpose padded

-- b :: Double
-- b = sqrt (fromIntegral (length "abcd"))