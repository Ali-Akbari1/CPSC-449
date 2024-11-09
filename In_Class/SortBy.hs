import Data.List 

myOrd :: Ord a => a -> a -> Ordering 
myOrd a1 a2 
    | a1 < a2   = GT 
    | a2 == a1  = EQ 
    | otherwise = LT 
    