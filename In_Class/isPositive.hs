

isPositive :: Int -> Maybe Int
isPositive x
    | x > 0 =       Just x
    | otherwise =   Nothing

main :: IO ()
main = do 
    print(isPositive 5)
    print(isPositive (-449))