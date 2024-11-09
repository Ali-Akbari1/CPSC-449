dotP :: [Int] -> [Int] -> Int 
dotP x y = foldr (+) 0 (zipWith (*) x y)

