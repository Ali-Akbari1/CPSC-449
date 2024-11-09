plus :: Int -> Int -> Int 
plus a b = a + b 

myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f initVal []     = initVal
myFoldr f initVal (x:xs) = f x (myFoldr f initVal xs)

foldSum :: [Int] -> Int 
foldSum x = myFoldr plus 0 x 
