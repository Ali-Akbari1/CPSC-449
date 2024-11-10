plus :: Int -> Int -> Int 
plus a b = a + b 

addN :: [Int] -> Int -> [Int]
addN value n = map (plus n) value

main = do
    print(addN [0,1,2,3,4] 100)