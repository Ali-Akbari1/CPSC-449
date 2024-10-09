vowel :: Char -> Bool
vowel ch = case ch of 
    'a' -> True
    'e' -> True
    'i' -> True
    'o' -> True
    'u' -> True
    otherwise -> False

main = do
    putStrLn "Enter a character to check for a vowel"
    x <- getLine
    print (x)
    let ch = head x
    print (vowel ch)
