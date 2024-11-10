plus :: Int -> Int -> Int 
plus x y = x + y

add5 :: [Int] -> [Int]
add5 x = map (plus 5) x 

main = do 
    print (add5 [0,1,2,3,4])