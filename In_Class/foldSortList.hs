insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys)
    | x > y     = y : insert x ys 
    | otherwise = x : y : ys 

iSort :: [Int] -> [Int] 
iSort xs = foldr insert [] xs 

main = print (iSort [1,5,3,2,0])
