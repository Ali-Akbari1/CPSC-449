import Data.Char


multiply :: Int -> Int -> Int
multiply _ 0 = 0
multiply 0 _ = 0
multiply x y 
    | y < 0     = negate (multiply x (negate y))
    | y > 0     = x + multiply x (y-1)
    | otherwise = x + multiply (x-1) y


binomial :: Int -> Int -> Int
-- Base case n choose 0 is 1
binomial n 0 = 1  
binomial n k
    | k > n     = 0      -- If k > n, return 0 
    | k > n - k = binomial n  (n - k) -- If k > n - k, use symmetry property: n choose k = n choose (n - k)
    | otherwise = (binomial n (k - 1) * (n - k + 1)) `div` k -- otherwise use binomial formula


-- myShow function that converts a string into an integer
myShow :: Int -> String

-- Base case: if the integer is 0, return an empty string
myShow 0 = ""

-- Recursive case: process the integer by repeatedly dividing by 10 and converting each digit
-- to its corresponding character using chr (48 is the ASCII value for '0')
myShow x = myShow (x `div` 10) ++ [chr (48 + x `mod` 10)]

myLength :: String -> Int
myLength [] = 0
myLength(_:str) = myLength str + 1

myEven :: Int -> Bool
myEven x = x `mod` 2 == 0

processAndCheck :: Int -> Bool
processAndCheck = myShow . myLength . myEven


powerOfTwoMaybe :: Integer -> Maybe Integer
powerOfTwoMaybe n 
    | n > 0     = Just (2^n)
    | otherwise = Nothing

data SF a = SS a | FF
    deriving Show 

factorialSF :: Integer -> SF Integer
factorialSF x 
    | x > 0     = SS (factorialSF(x-1) * x)
    | otherwise = FF

main = do
    print $ multiply (-4) (5)