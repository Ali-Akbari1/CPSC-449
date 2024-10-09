lstFactors :: Int -> [Int]
lstFactors n = [x | x <- [1..n], n `mod` x == 0]
main = print (lstFactors 20)