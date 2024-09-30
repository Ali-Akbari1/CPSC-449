-- Ali Akbari 30171539
-- Assignment 1 Question 4

data SF a = SS a | FF
  deriving (Show, Eq)


-- Function that returns the factorial of an integer
factorial :: Integer -> Integer

--Base case, factorial of 0 is 1
factorial 0 = 1

-- Recursive call x is multiplied by the factorial of x-1
factorial x = x * factorial (x-1)


-- powerOfTwoMaybe function that returns the 2^n if the input is non-negative
powerOfTwoMaybe :: Integer -> Maybe Integer

-- If n is non-negative return Just 2^n, else return Nothing
powerOfTwoMaybe n 
    | n > -1     = Just (2^n) 
    | otherwise  = Nothing


-- factorialSF function that returns the factorial of a non-negative number
factorialSF :: Integer -> SF Integer

-- If input is non-negative return SS factorial x, otherwise return FF
factorialSF x 
    | x > -1    = SS (factorial x)
    | otherwise = FF

-- invExpEither function that returns Right x which is the largest power of two less than or equal to the number
-- Or if the input is negative returns Left then an error message
invExpEither :: Integer -> Either String Integer
invExpEither x
    | x < 0     = Left "Input must be a non-negative integer"
    | x == 0    = Right 0
    | otherwise = Right (largestPowerOfTwo x)

-- Helper function that finds the largest power of two less than or equal to x
largestPowerOfTwo :: Integer -> Integer
largestPowerOfTwo x = findLargestPower 0 x


-- Recursive function that finds the largest power of 2 less than or equal to x
findLargestPower :: Integer -> Integer -> Integer
findLargestPower n x
    | 2^n > x  = n - 1  -- If 2^n exceeds x, return n-1
    | otherwise = findLargestPower (n + 1) x  -- Otherwise, continue incrementing n
