chop :: [Int] -> [Int]
chop x 
    | length(x) <= 2    = []
    | otherwise         = reverse(tail(reverse(tail x)))

main = do 
    print (chop [])
    print (chop [1])
    print (chop [1,2])
    print (chop [1..10])    