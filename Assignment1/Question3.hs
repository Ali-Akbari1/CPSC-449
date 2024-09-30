-- Ali Akbari 30171539
-- Assignment 1 Question 3

import Data.Char

myShow :: Int -> String
myShow 0 = ""
myShow x = myShow (x `div` 10) ++ [chr (48 + x `mod` 10)]



myLength :: String -> Int
myLength []      = 0
myLength (_:str) = 1 + myLength str

myEven :: Int -> Bool
myEven x = x `mod` 2 == 0

processAndCheck :: Int -> Bool
processAndCheck = myEven . myLength . myShow