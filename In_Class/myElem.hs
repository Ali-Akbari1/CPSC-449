myElem :: Eq a => a -> [a] -> Bool 
myElem x [] = False 
myElem x (y:ys) = (x == y) || myElem x ys