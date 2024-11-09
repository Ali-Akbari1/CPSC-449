myMin :: Int -> Int -> Int 
myMin a b 
    | a <= b     = a
    | otherwise  = b

myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f initVal []     = initVal
myFoldr f initVal (x:xs) = f x (myFoldr f initVal xs)


foldMin :: [Int] -> Int 
foldMin xs = myFoldr myMin (head xs) xs 