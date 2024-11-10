data BorD = BorD (Int -> Int) Int

result1, result2 :: BorD 
result1 = BorD (\x -> x + 5) 10
result2 = BorD(\x -> x -10) 100
main = do 
    let BorD _ arg = result2 
    let BorD f _ = result1 
    print (f arg)