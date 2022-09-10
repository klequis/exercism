module DNA (toRNA) where

-- -- https://github.com/guilhermehas/exercism/blob/55b6ab7632ef8431deccb7e42f099392d9bd76ca/haskell/rna-transcription/src/DNA.hs

toRNA :: String -> Either Char String
toRNA xs = mapM convertChar xs

-- mapM :: (Traversable t, Monad m) => (a -> m b) -> t a -> m (t b)
-- What type does `a` become?
--   Since the function (a -> m b) is `convertChar` the `m` is `Either Char Char`
-- What is a "Traversable"?
--   In this example it is `xs` which is a list which has a `Traversable` instance.
--   Traversable: see [Data.Traversable Overview](https://hackage.haskell.org/package/base-4.17.0.0/docs/Data-Traversable.html#g:4)
convertChar :: Char -> Either Char Char
convertChar 'G' = Right 'C'
convertChar 'C' = Right 'G'
convertChar 'T' = Right 'A'
convertChar 'A' = Right 'U'
convertChar x = Left x