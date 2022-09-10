import Text.Read ( readMaybe )
import Data.Maybe ( catMaybes, mapMaybe )

{-
    The mapMaybe function is a version of map which can throw out elements. 
    In particular, the functional argument returns something of type Maybe b. 
    If this is Nothing, no element is added on to the result list. 
  ** Nothing is not included in the result
    If it is Just b, then b is included in the result list.
  ** Values are extracted from Just so `Just 1` becomes `1`.
-}

-- adapt readMaybe to Int
readMaybeInt :: String -> Maybe Int
readMaybeInt = readMaybe :: String -> Maybe Int

-- using mapMaybe
a :: [Int]
a = mapMaybe readMaybeInt ["1", "Foo", "3"]
-- [1,3]

-- an alternative that is lonter
b :: [Int]
b = catMaybes $ map readMaybeInt ["1", "Foo", "3"]
-- [1,3]
{- suggestion is
  Found:
    catMaybes $ map readMaybeInt ["1", "Foo", "3"]
  Why not:
    mapMaybe readMaybeInt ["1", "Foo", "3"]
-}

-- readMaybeInt returns a `Just`
d :: Maybe Int
d = readMaybeInt "1"
-- Just 1

