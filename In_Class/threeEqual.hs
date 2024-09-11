main :: IO()
threeEqual :: Int -> Int -> Int -> Bool
threeEqual a b c = (a == b) && (b == c)
main = print $ threeEqual 1 1 1