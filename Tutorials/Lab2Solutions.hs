import Test.QuickCheck

-- Change the below function so the discriminant and the denominator of the quadratic formula are defined as local variables using "let" and "in"
roots :: Double -> Double -> Double -> (Double, Double)
roots a b c = 
    let discriminant = b*b - 4*a*c
        denominator = 2*a
    in ((-b + sqrt discriminant) / denominator,
        (-b - sqrt discriminant) / denominator)
        
-- Used for testing your roots function
rootsTest :: Double -> Double -> Double -> (Double, Double)
rootsTest a b c = 
    ((-b + sqrt(b*b-4*a*c ) ) / ( 2*a ) ,
    (-b-sqrt(b*b-4*a*c) ) / ( 2*a ) )

-- This function should use the discriminant in a quadratic expression to determine distinct real roots
numberNDroots :: Float -> Float -> Float -> Integer
numberNDroots a b c = 
    let discriminant = b*b - 4*a*c
    in if discriminant > 0 then 2
       else if discriminant == 0 then 1
       else 0

-- Implement the fibonacci sequence using recursion
fibonacci :: Integer -> Integer
fibonacci n
    | n <= 1    = n
    | otherwise = fibonacci (n-1) + fibonacci (n-2)

-- Implement a factorial function using recursion
factorial :: Integer -> Integer
factorial n
    | n <= 1    = 1
    | otherwise = n * factorial (n-1)

-- Implement a function that uses string concatenation to separate the strings across three lines
onThreeLines :: String -> String -> String -> String
onThreeLines s1 s2 s3 = s1 ++ "\n" ++ s2 ++ "\n" ++ s3

-- Using Haskell guard syntax, implement a function which takes a character from 1-9 and returns the roman numeral of it
romanDigit :: Char -> String
romanDigit c
    | c == '1' = "I"
    | c == '2' = "II"
    | c == '3' = "III"
    | c == '4' = "IV"
    | c == '5' = "V"
    | c == '6' = "VI"
    | c == '7' = "VII"
    | c == '8' = "VIII"
    | c == '9' = "IX"
    | otherwise = "Invalid input"

-- Implement a function that calculates the sum of squares for the first n natural numbers.
sumOfSquares :: Int -> Int
sumOfSquares n = sumOfSquaresHelper n 1 0

sumOfSquaresHelper :: Int -> Int -> Int -> Int
sumOfSquaresHelper n current acc
    | current > n = acc
    | otherwise = sumOfSquaresHelper n (current + 1) (acc + current * current)

-- Implement a function to check if a given number is prime
isPrime :: Int -> Bool
isPrime n = isPrimeHelper n 2

isPrimeHelper :: Int -> Int -> Bool
isPrimeHelper n divisor
    | n <= 1          = False
    | divisor * divisor > n = True
    | n `mod` divisor == 0  = False
    | otherwise       = isPrimeHelper n (divisor + 1)

-- Implement a function that uses function composition to take a number, adds 3, multiply by 2, subtract 1, and then takes the absolute value. 
complexOperation :: Int -> Int
complexOperation = abs . subtract 1 . (*2) . (+3)

prop_roots :: Double -> Double -> Double -> Bool
prop_roots a b c = compareRoots (roots a b c) (rootsTest a b c)

compareRoots :: (Double, Double) -> (Double, Double) -> Bool
compareRoots (r1, r2) (t1, t2) =
    (compareValue r1 t1) && (compareValue r2 t2)

compareValue :: Double -> Double -> Bool
compareValue x y
    | isNaN x && isNaN y = True
    | isInfinite x && isInfinite y = True
    | otherwise = x == y