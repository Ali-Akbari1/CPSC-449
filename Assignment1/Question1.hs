-- Ali Akbari 30171539
-- Assignment 1 Question 1

-- Doesn't work for when y is a negative number
multiply :: Int -> Int -> Int

-- Base Cases if recursive function reaches 0
multiply _ 0 = 0
multiply 0 _ = 0

-- Recursive multiplication, adding x to itself y times
multiply x y = x + multiply x (y-1)
