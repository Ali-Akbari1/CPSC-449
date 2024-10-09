-- Higher function 

square :: Int -> Int 
square n = n * n

applyToTuple :: (Int -> Int) -> (Int, Int, Int) -> (Int, Int, Int)
applyToTuple f (a, b, c) = (f a, f b, f c)

main = print(applyToTuple square (1,2,3))
