myMin :: Int -> Int -> Int 
myMin a b 
    | a <= b     = a
    | otherwise  = b

myFoldr1 :: (a -> a -> a) -> [a] -> a
myFoldr1 f [x]      = x
myFoldr1 f (x:xs)   = f x (myFoldr1 f xs)

foldMin :: [Int] -> Int 
foldMin xs = myFoldr1 myMin xs