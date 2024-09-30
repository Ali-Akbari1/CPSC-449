-- Ali Akbari 30171539
-- Assignment 1 Question 4

data SF a = SS a | FF
  deriving (Show, Eq)


factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x * factorial (x-1)


powerOfTwoMaybe :: Integer -> Maybe Integer
powerOfTwoMaybe n 
    | n > -1     = Just (2^n) 
    | otherwise  = Nothing

factorialSF :: Integer -> SF Integer
factorialSF x 
    | x > -1    = SS (factorial x)
    | otherwise = FF

invExpEither :: Integer -> Either String Integer
invExpEither x
    | x < 0     = Left "Input must be a non-negative integer"
    | x == 0    = Right 0
    | otherwise = Right (largestPowerOfTwo x)

largestPowerOfTwo :: Integer -> Integer
largestPowerOfTwo x = findLargestPower 0 x

-- This function increments n until 2^n exceeds x
findLargestPower :: Integer -> Integer -> Integer
findLargestPower n x
    | 2^n > x  = n - 1  -- If 2^n exceeds x, return n-1
    | otherwise = findLargestPower (n + 1) x  -- Otherwise, continue incrementing n
