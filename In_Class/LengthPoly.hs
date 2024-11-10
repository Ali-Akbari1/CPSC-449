myLength :: [a] -> Int
myLength list = case list of 
    [] -> 0
    _:xs -> 1 + myLength xs 

main = do 
    print (myLength [True,False,False])