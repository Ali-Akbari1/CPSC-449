
-- Simple Function to calculate exclusive OR of two variables
main :: IO()
exOr :: Bool -> Bool -> Bool
exOr x y = (x || y) && not (x && y)
main = print (exOr True False)
