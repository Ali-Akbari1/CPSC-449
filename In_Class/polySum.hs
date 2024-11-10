polySum :: Num a => [a] -> a 
polySum list = case list of 
    [] -> 0
    x:xs -> x + polySum xs 

main = do 
    print(polySum [1.0,2.3,4.5])
    print(polySum [1..10])