-- https://exercism.org/tracks/haskell/exercises/grains/solutions/abo64
{-
    I found this one interesting because he used an `instance` to
      set min & max bound
-}

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Grainsabo64 (square, total) where

import Data.Maybe (mapMaybe)

newtype ChessboardSquare = ChessboardSquare Int
  deriving (Num, Eq, Enum, Ord, Real, Integral)

instance Bounded (ChessboardSquare) where
  minBound = 1
  maxBound = 64

square :: Integral a => ChessboardSquare -> Maybe a
square n
  | minBound <= n && n <= maxBound = Just $ 2 ^ pred n
  | otherwise = Nothing

-- total :: Integer
total = sum $ mapMaybe square allChessboardSquares
  where
    allChessboardSquares = [minBound .. maxBound]

x = mapMaybe square [minBound .. maxBound]
y = map square [1..64]