-- Ali Akbari 30171539
-- Assignment 1 Question 1

-- Function that returns the multiplication of two numbers using recursion
multiply :: Int -> Int -> Int

-- Base Cases if recursive function reaches 0
multiply _ 0 = 0
multiply 0 _ = 0

-- Recursive multiplication, adding x to itself y times or vice versa
multiply x y 
    | y > 0         = x + multiply x (y-1)
    | otherwise     = y + multiply (x-1) y
