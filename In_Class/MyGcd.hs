
mygcd :: Int -> Int -> Int
mygcd x y
    | mod x y == 0      = 0
    | otherwise         = mygcd y (mod x y)

main = do
    print $ mygcd 12 4