myString :: String
myString = "cat" ++ "\n" ++ "fish"

main :: IO ()
main = do
    let result = myString
    putStrLn result
