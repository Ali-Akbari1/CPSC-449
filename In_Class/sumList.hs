sumElement :: [Int] -> Int
sumElement [] = 0
sumElement (x:xs) = x + sumElement xs
main = print(sumElement [1,2,3,4,5,6])