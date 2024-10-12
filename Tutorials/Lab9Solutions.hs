
-- 1. Create a list of tuples where the first element is a number from 1 to 10
--    and the second element is that number squared.
-- Example: [(1,1), (2,4), (3,9), ...]
squarePairs :: [(Int, Int)]
squarePairs = [(x, x^2) | x <- [1..10]]

-- 2. Write a function that takes a list of integers and returns a list of tuples,
--    where each tuple contains the original number and its absolute value.
-- Example: absValuePairs [-1, 2, -3] should return [(-1,1), (2,2), (-3,3)]
absValuePairs :: [Int] -> [(Int, Int)]
absValuePairs xs = [(x, abs x) | x <- xs]

-- 3. Implement a function that generates a list of all possible combinations
--    of two lists as tuples.
-- Example: combinations [1,2] ['a','b'] should return [(1,'a'),(1,'b'),(2,'a'),(2,'b')]
combinations :: [a] -> [b] -> [(a, b)]
combinations xs ys = [(x, y) | x <- xs, y <- ys]

-- 4. Create a function that takes a list of integers and returns a list of tuples,
--    where each tuple contains adjacent elements from the original list.
-- Example: adjacentPairs [1,2,3,4] should return [(1,2),(2,3),(3,4)]
adjacentPairs :: [a] -> [(a, a)]
adjacentPairs (x:y:xs) = (x,y) : adjacentPairs (y:xs)
adjacentPairs _ = []

-- 5. Write a recursive function that calculates the dot product of two vectors
--    represented as lists of the same length.
-- Example: dotProduct [1,2,3] [4,5,6] should return 32 (1*4 + 2*5 + 3*6)
dotProduct :: Num a => [a] -> [a] -> a
dotProduct [] [] = 0
dotProduct (x:xs) (y:ys) = x * y + dotProduct xs ys

-- 6. Implement a function that takes a list of tuples (String, Int) representing
--    items and their prices, and returns the total cost of items costing less than 50.
-- Example: totalCostUnder50 [("apple", 30), ("banana", 60), ("orange", 40)] should return 70
totalCostUnder50 :: [(String, Int)] -> Int
totalCostUnder50 items = sum [price | (_, price) <- items, price < 50]

-- 7. Create a function that takes a list of integers and returns a list of tuples,
--    where each tuple contains the original number and its factorial.
--    Use guards in the factorial calculation.
-- Example: factorialPairs [1,2,3] should return [(1,1),(2,2),(3,6)]
factorialPairs :: [Int] -> [(Int, Int)]
factorialPairs xs = [(x, factorial x) | x <- xs]
  where
    factorial n
      | n <= 1 = 1
      | otherwise = n * factorial (n - 1)

-- 8. Use the filter function to create a list of all palindromic numbers 
-- between 1 and 1000. A number is palindromic if it reads the same backwards 
-- as forwards when written as a string.
palindromicNumbers :: [Int]
palindromicNumbers = filter isPalindromic [1..1000]
  where
    isPalindromic n = show n == reverse (show n)


-- 9. Use a lambda function to create a list of tuples where the first element
-- is a number from 1 to 5, and the second element is that number raised to a given power.
-- The power should be a parameter of the function.
-- Example: powerTuples 2 should return [(1,1),(2,4),(3,9),(4,16),(5,25)]
-- Hint: Use a lambda function inside of list comprehension
powerTuples :: Int -> [(Int, Int)]
powerTuples n = [(x, (\y -> y^n) x) | x <- [1..5]]