-- This file demonstrates the use of `curry`, `uncurry`, partial application, and `fold`
-- with a recursive data structure.

data Tree a = Leaf | Node a (Tree a) (Tree a)
    deriving (Show)

-- Example tree with each node contains of a tuple (a, a)
exampleTree :: Tree (Int,Int)
exampleTree = Node (3, 4) 
                   (Node (1, 2) Leaf Leaf) 
                   (Node (5, 6) (Node (7, 8) Leaf Leaf) Leaf)


-- Question 1: Calculate the sum of the product of each node’s tuple values.
sumProduct :: Tree (Int, Int)  -> Int
sumProduct = undefined

-- Question 2: Map over a tree, applying a function to each tuple.
mapTree :: (a -> b) -> Tree a -> Tree b
mapTree = undefined

-- Question 3: apply a function that doubles each element in the tuple.
doubleValues :: (Int, Int) -> (Int, Int)
doubleValues = undefined
-- Example: `mapTree doubleValues exampleTree` 

-- Question 4: use * and uncurry to multiply two elements of each pair in the tree
productUncurryTree :: Tree (Int, Int) -> Tree Int
productUncurryTree = undefined


-- Question 5: Function to add a constant to both values in each node’s tuple.
addConstant :: Int -> Tree (Int, Int) -> Tree (Int, Int)
addConstant = undefined

-- Question 6: Partial application example: adding 10 to each node.
addTenToTree ::  Tree (Int, Int) -> Tree (Int, Int)
addTenToTree = undefined


-- Question 7: Function to count nodes based on a predicate applied to the tuple.
countNodes :: ((Int, Int) -> Bool) -> Tree (Int, Int) -> Int
countNodes = undefined

-- Question 8: Example: Using uncurry to apply a sum predicate.
sumGreaterThan :: Int -> (Int, Int) -> Bool
sumGreaterThan = undefined

-- Example: `countNodes (sumGreaterThan 7) exampleTree`


-- Question 9: Define a fold function for the Tree data type
foldTree :: (a -> b -> b -> b) -> b -> Tree a -> b
foldTree = undefined

-- Question 10: Using foldTree to sum all tuple products in the tree
sumProductFold :: Tree (Int, Int) -> Int
sumProductFold = undefined


-- Question 11: Using foldTree to count all nodes with a tuple sum greater than a threshold
countGreaterThan :: Int -> Tree  (Int, Int) -> Int
countGreaterThan threshold = undefined

-- Example: `countGreaterThan 7 exampleTree` counts nodes where tuple sums exceed 7.

-- Question 12: Using foldTree to create a new Tree by applying a transformation function
mapTreeFold :: (a -> b) -> Tree a -> Tree b
mapTreeFold f = undefined

-- Example: `mapTreeFold doubleValues exampleTree` doubles each value in the tree tuples.
