-- https://github.com/guilhermehas/exercism/blob/55b6ab7632ef8431deccb7e42f099392d9bd76ca/haskell/rna-transcription/src/DNA.hs

transfLetter :: Char -> Char
transfLetter ch = case ch of
                    'G' -> 'C'
                    'C' -> 'G'
                    'T' -> 'A'
                    'A' -> 'U'
                    _ -> ' '

toRNA :: String -> Maybe String
toRNA xs = 
    let rna = map transfLetter xs
      in if any (== ' ') rna then Nothing else Just rna