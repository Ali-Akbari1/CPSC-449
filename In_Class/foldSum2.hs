plus :: Int -> Int -> Int
plus a b = a + b

myFoldr1 :: (a -> a -> a) -> [a] -> a
myFoldr1 f [x]      = x
myFoldr1 f (x:xs)   = f x (myFoldr1 f xs)

foldSum :: [Int] -> Int
foldSum x = myFoldr1 plus x 

