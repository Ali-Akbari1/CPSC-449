myDouble :: Int -> Int -> Int 
myDouble m n = 2*m+n

myFlip :: (a -> b -> c) -> (b -> a -> c)
myFlip f = \y x -> f x y 

main = do 
    print((myFlip myDouble) 1 2)