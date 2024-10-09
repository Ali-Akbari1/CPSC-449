
minAndMax :: Int -> Int -> (Int, Int)
minAndMax x y 
    | x >= y    = (y, x)
    | otherwise = (x, y)