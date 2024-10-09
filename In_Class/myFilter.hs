

isEven :: Int -> Bool
isEven 0 = True
isEven n = isOdd (n-1)

isOdd :: Int -> Bool
isOdd 0 = False
isOdd n = isEven (n-1)

myFilter :: (Int -> Bool) -> [Int] -> [Int]
myFilter func (x:xs)
    | func x        = x : myFilter func xs 
    | otherwise     = myFilter func xs
myFilter _ [] = []

main = print(myFilter isOdd [0..9])