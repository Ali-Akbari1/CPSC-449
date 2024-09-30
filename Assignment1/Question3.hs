-- Ali Akbari 30171539
-- Assignment 1 Question 3

import Data.Char

-- myShow function that converts a string into an integer
myShow :: Int -> String

-- Base case: if the integer is 0, return an empty string
myShow 0 = ""

-- Recursive case: process the integer by repeatedly dividing by 10 and converting each digit
-- to its corresponding character using chr (48 is the ASCII value for '0')
myShow x = myShow (x `div` 10) ++ [chr (48 + x `mod` 10)]


-- myLength function to return the length of a string
myLength :: String -> Int

-- Base case if the string is empty, length is 0
myLength []      = 0

-- Recursive case: for each character in the string increment by 1 and return the rest of the string
myLength (_:str) = 1 + myLength str


-- myEven function to return if a number is even
myEven :: Int -> Bool

-- True if the number is divisible by 2, else False
myEven x = x `mod` 2 == 0


-- processAndCheck function which uses the functions above to check if the number of digits of an input integer is even 
processAndCheck :: Int -> Bool
processAndCheck = myEven . myLength . myShow