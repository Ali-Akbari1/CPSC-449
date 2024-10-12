
-- List Comprehension and Tuple Exercises part 2
{- We will continue from the last lab.

Here are some important Haskell functions for list processing:

1. filter :: (a -> Bool) -> [a] -> [a]
   The filter function takes a predicate and a list, and returns a new list containing only the elements that satisfy the predicate.
   Example: filter even [1,2,3,4,5] returns [2,4]

2. map :: (a -> b) -> [a] -> [b]
   The map function applies a given function to every element in a list and returns a new list with the results.
   Example: map (*2) [1,2,3] returns [2,4,6]

These functions are powerful tools for list manipulation and can often be used as alternatives to list comprehension.
-}

-- 1. Write a function that takes a string and returns a list of tuples,
--    where each tuple contains a character and its frequency in the string.
charFrequency :: String -> [(Char, Int)]
charFrequency str = [(c, length (filter (==c) str)) | c <- ['a'..'z'], c `elem` str]

-- 2. Implement a function that takes two lists of equal length and
--    returns a list of tuples, where each tuple contains elements from
--    both lists at the same index, but only if their sum is even.
evenSumPairs :: [Int] -> [Int] -> [(Int, Int)]
evenSumPairs xs ys = [(x, y) | (x, y) <- zip xs ys, even (x + y)]

-- 3. Create a recursive function that takes a list of tuples (Int, Int)
--     representing coordinates and returns the Manhattan distance from (0,0)
--     to the point furthest from the origin.
maxManhattanDistance :: [(Int, Int)] -> Int
maxManhattanDistance [] = 0
maxManhattanDistance ((x, y):rest) = max (abs x + abs y) (maxManhattanDistance rest)

-- 4. Write a function that takes a list of integers and returns a list of tuples,
--     where each tuple contains a number and a string "Even" or "Odd".
--     Use guards to determine if a number is even or odd.
evenOddClassify :: [Int] -> [(Int, String)]
evenOddClassify xs = [(x, classify x) | x <- xs]
  where
    classify n
      | even n = "Even"
      | otherwise = "Odd"

-- 5. Implement a function that takes a list of strings and returns a list of tuples,
--     where each tuple contains a string and its length, but only for strings
--     that start with a vowel.
vowelStringLengths :: [String] -> [(String, Int)]
vowelStringLengths strs = [(s, length s) | s <- strs, head s `elem` "aeiouAEIOU"]

-- 6. Create a recursive function that takes a list of tuples (String, Int)
--     representing items and their quantities, and returns the total number of items.
totalItems :: [(String, Int)] -> Int
totalItems [] = 0
totalItems ((_, quantity):rest) = quantity + totalItems rest

-- 7. Implement a function that takes a list of tuples (String, Int) representing
--     students and their scores, and returns a list of tuples (String, Char)
--     where the second element is the grade (A, B, C, D, or F) based on the score.
--     Use guards to determine the grade.
assignGrades :: [(String, Int)] -> [(String, Char)]
assignGrades students = [(name, gradeFor score) | (name, score) <- students]
  where
    gradeFor score
      | score >= 90 = 'A'
      | score >= 80 = 'B'
      | score >= 70 = 'C'
      | score >= 60 = 'D'
      | otherwise = 'F'