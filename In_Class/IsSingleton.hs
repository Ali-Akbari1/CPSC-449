myLength :: [a] -> Bool 
myLength a = case a of
    []      -> False
    (x:[])  -> True
    _       -> False

main = print (myLength [], myLength [1], myLength [2,3])