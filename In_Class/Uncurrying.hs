sZip = zip [1,3,5] [2,4,6]
sMap = map (uncurry (*)) sZip 
s = foldr1 (+) sMap 
sOneLine = foldr1 (+)
        (map (uncurry (*)) (zip [1,3,5][2,4,6]))

main = do 
    print sZip 
    print sMap 
    print s
    print sOneLine