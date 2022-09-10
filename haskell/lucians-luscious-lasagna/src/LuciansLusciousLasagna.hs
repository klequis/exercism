-- module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where

-- TODO: define the expectedMinutesInOven constant
{-# OPTIONS_GHC -Wno-missing-signatures #-}

expectedMinutesInOven :: Integer
expectedMinutesInOven = 40

preparationTimeInMinutes :: Num a => a -> a
preparationTimeInMinutes layers = layers * 3

elapsedTimeInMinutes :: Num a => a -> a -> a
elapsedTimeInMinutes numLayers minInOven = preparationTimeInMinutes numLayers + minInOven
