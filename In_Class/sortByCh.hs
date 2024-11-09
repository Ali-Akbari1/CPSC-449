import Data.List 
import Data.Char 

myOrd :: Ord a => a -> a -> Ordering 
myOrd a1 a2 
    | a1 < a2   = GT 
    | a2 == a1  = EQ 
    | otherwise = LT 

main = print (sortBy myOrd ["orange", "apple", "bananas", "pineapple"])
    