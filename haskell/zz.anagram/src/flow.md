

xs = "listen"
yss = ["enlists", "google", "inlets", "banana"]
r = ["inlets"]

Checks
- is not exact word
- ltrs count matches match
- can mk wd

- case insensitive

# zipAndFilter

zipAndFilter [Bool] -> [a] -> [a]
zipAndFilter bs as filter (\(x,y) -> x == True) z
  where z = zip bs as


# letterCountMatches

## in
xs = "listen"
yss = ["enlists", "google", "inlets", "banana"]

xs = [(1,'e'),(1,'i'),(1,'l'),(1,'n'),(1,'s'),(1,'t')]

yss = [
    [(1,'e'),(1,'i'),(1,'l'),(1,'n'),(2,'s'),(1,'t')],
    [(1,'e'),(2,'g'),(1,'l'),(2,'o')],
    [(1,'e'),(1,'i'),(1,'l'),(1,'n'),(1,'s'),(1,'t')], -- **
    [(3,'a'),(1,'b'),(2,'n')]
  ]

tOrf = [False, False, True, False]

z = zipAndFilter tOrf yss

<!-- z = [(False,"enlists"), (False,"google"), (True,"inlets"), (False,"banana")]
return filter (\(x,y) -> x == True) z -->

## out
out = ["inlets"]

# canMakeWord

canMkWd :: String -> String -> Bool
canMkWd xs ys = all (==True) [notEqual, allLtrs]
  where notEqual = xs /= ys
        allLtrs = hasAllLetters xs ys
        -- sameLen = length xs == length ys


## in

xs = "listen"
yss = ["inlets"]

They should not be the same word

notEqual = map (\ys  -> ys /= xs) yss
notEqual = [True]

z = zipAndFilter notEqual yss

## out
["inlets"]

> I could make a data structure for the (True, String) tuple check and filter













