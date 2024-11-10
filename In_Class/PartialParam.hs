quotient :: Int -> Int -> Int 
quotient a b = ´div´ (2*a) b 

dividend :: Int -> Int 
dividend = quotient 8 

main = do 
    print (dividend 5)