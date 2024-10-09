y = filter (\x -> (mod) x 2 == 0) [1..10] 
main = do
    print y