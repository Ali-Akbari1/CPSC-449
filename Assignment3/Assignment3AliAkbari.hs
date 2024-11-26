-- Ali Akbari 30171539
-- Assignment 3


-- Question 1
-- Function to process a nested list of integers by squaring even numbers
processNestedList :: [[Int]] -> [Int]
processNestedList [] = [] -- Base case: if list is empty, return empty list
processNestedList xss = map (^2) (filter even (concat xss)) -- Flatten list, filter evens, square each


-- Function to get the first element of a pair
fst' :: (a, b) -> a
fst' = uncurry (\ x y -> x) -- Uses uncurry to extract the first element of a tuple

-- Function to get the second element of a pair
snd' :: (a, b) -> b
snd' = uncurry (\ x y -> y) -- Uses uncurry to extract the second element of a tuple


-- Question 2
-- Function to add two matrices
matrixAddition :: [[Int]] -> [[Int]] -> [[Int]]
matrixAddition = zipWith (zipWith (+)) -- Use zipWith to apply zipWith (+) on each row of the matrices

-- Multiplies every element of a matrix by a scalar
scalarMultiply :: Int -> [[Int]] -> [[Int]]
scalarMultiply scalar = map (map (* scalar)) -- Apply map twice: the inner map multiplies each element in a row by the scalar, and the outer map applies this to each row

-- You can partially apply `scalarMultiply` by providing only the scalar argument.
-- This creates a new function that expects a matrix as its argument.


-- Calculates the trace of a square matrix (sum of diagonal elements)
matrixTrace :: [[Int]] -> Int
matrixTrace matrix = foldr (+) 0 [row !! i | (row, i) <- zip matrix [0..]] -- Create a list of diagonal elements by zipping each row with its index, then sum this list using foldr (+) with an initial accumulator of 0



-- Question 3
-- Class and Data Types
class Shape a where
    area :: a -> Double
data Circle = Circle Double
data Rectangle = Rectangle Double Double


instance Shape Circle where
    area (Circle r)= 3.14* r*r -- Calculate the area of a circle using pi * r^2

instance Shape Rectangle where
    area (Rectangle l w)= l*w -- Calculate the area of a rectangle as length * width


-- Question 4
-- Data Type for AVL Trees
data AVLTree a = Empty | Node a (AVLTree a) (AVLTree a)


-- Function to calculate the height of an AVL tree
heightAVL :: AVLTree a -> Int
heightAVL Empty = -1 -- An empty tree has a height of -1 by convention
heightAVL (Node _ left right) = 1 + max (heightAVL left) (heightAVL right) -- The height of a node is 1 + the maximum height of its left and right subtrees

-- Function to check if the AVL tree is ordered
isOrdered :: (Ord a) => AVLTree a -> Bool
isOrdered Empty = True -- Empty tree is ordered
isOrdered (Node val left right) =
  isOrdered left && isOrdered right && -- Recursively check that both subtrees are ordered
  allValues (< val) left && allValues (> val) right -- Ensure all values in the left subtree are less than val, and all values in the right subtree are greater than val
  where
    allValues :: (a -> Bool) -> AVLTree a -> Bool
    allValues _ Empty = True -- All values in an empty tree satisfy any predicate
    allValues predicate (Node v l r) = predicate v && allValues predicate l && allValues predicate r -- Check that each node in the subtree satisfies the given predicate


-- Function to check if the AVL tree is balanced
isBalanced :: AVLTree a -> Bool
isBalanced Empty = True -- An empty tree is balanced
isBalanced (Node _ left right) =
  abs (heightAVL left - heightAVL right) <= 1 && -- Check if the height difference is at most 1
  isBalanced left && isBalanced right -- Recursively check that both subtrees are balanced

