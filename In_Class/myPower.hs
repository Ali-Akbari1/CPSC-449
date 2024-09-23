
myPower :: Int -> Int -> Int
myPower x n
    | n == 1    = x
    | n > 1     = x * myPower x (n-1)

main = do 
    print $ myPower 2 8