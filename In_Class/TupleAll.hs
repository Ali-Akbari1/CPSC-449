type PairType = (Int, String)

samplePair1 :: PairType
samplePair1 = (249, "midterm")

samplePair2 :: PairType
samplePair2 = (200, "final")

sumPair :: PairType -> PairType -> PairType
sumPair (a, b) (c,d) = (a+c, b++ " + " ++d)

main = do
    print $ fst samplePair1
    print $ snd samplePair1
    print $ sumPair samplePair1 samplePair2