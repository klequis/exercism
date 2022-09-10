{-# LANGUAGE OverloadedStrings #-}

-- fn4 cur prev next
--   | isUpper cur && isUpper next = concat [prev, cur, '|' next] -- [A] HyperText
--   | cur == '-' isAlphaNum next = concat [prev, ' ', next]  -- [B] metal-oxide

fn4 cur prev next
  | isUpper cur && isUpper next = concat [prev, cur, '|' next] -- [A] HyperText

  
fn3 cur prev next 
  | ch == 39 = Nothing
  | ch == 32 = Just '|'
  | ch == 44 = Nothing
  | ch == 45 = Just '|'
  | ch == 95 = Nothing
  | otherwise = fn4 cur prev next
  where curInt = fromEnum cur

-- cur