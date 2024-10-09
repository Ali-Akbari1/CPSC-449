isEmpty :: [a] -> Bool
isEmpty a = 
    case a of 
        [] -> True
        _ -> False

main = print(isEmpty [1,2,3], isEmpty ["1"], isEmpty [])