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
sumProduct Leaf = 0
sumProduct (Node (a, b) left right) = (a * b) + sumProduct left + sumProduct right

-- Question 2: Map over a tree, applying a function to each tuple.
mapTree :: (a -> b) -> Tree a -> Tree b
mapTree _ Leaf = Leaf
mapTree f (Node value left right) = Node (f value) (mapTree f left) (mapTree f right)

-- Question 3: apply a function that doubles each element in the tuple.
doubleValues :: (Int, Int) -> (Int, Int)
doubleValues = \(a, b) -> (a * 2, b * 2)
-- Example: `mapTree doubleValues exampleTree` 

-- Question 4: use * and uncurry to multiply two elements of each pair in the tree
productUncurryTree :: Tree (Int, Int) -> Tree Int
productUncurryTree = mapTree (uncurry (*))


-- Question 5: Function to add a constant to both values in each node’s tuple.
addConstant :: Int -> Tree (Int, Int) -> Tree (Int, Int)
addConstant _ Leaf = Leaf
addConstant c (Node (a, b) left right) = Node (a + c, b + c) (addConstant c left) (addConstant c right)

-- Question 6: Partial application example: adding 10 to each node.
addTenToTree ::  Tree (Int, Int) -> Tree (Int, Int)
addTenToTree = addConstant 10


-- Question 7: Function to count nodes based on a predicate applied to the tuple.
countNodes :: ((Int, Int) -> Bool) -> Tree (Int, Int) -> Int
countNodes _ Leaf = 0
countNodes predicate (Node pair left right)
    | predicate pair = 1 + countNodes predicate left + countNodes predicate right
    | otherwise = countNodes predicate left + countNodes predicate right

-- Question 8: Example: Using uncurry to apply a sum predicate.
sumGreaterThan :: Int -> (Int, Int) -> Bool
sumGreaterThan threshold = uncurry (\a b -> a + b > threshold)

-- Example: `countNodes (sumGreaterThan 7) exampleTree`


-- Question 9: Define a fold function for the Tree data type
foldTree :: (a -> b -> b -> b) -> b -> Tree a -> b
foldTree _ base Leaf = base
foldTree f base (Node value left right) = f value (foldTree f base left) (foldTree f base right)

-- Question 10: Using foldTree to sum all tuple products in the tree
sumProductFold :: Tree (Int, Int) -> Int
sumProductFold = foldTree (\(a, b) left right -> (a * b) + left + right) 0


-- Question 11: Using foldTree to count all nodes with a tuple sum greater than a threshold
countGreaterThan :: Int -> Tree  (Int, Int) -> Int
countGreaterThan threshold = foldTree countFunc 0
  where countFunc (a, b) left right = (if a + b > threshold then 1 else 0) + left + right

-- Example: `countGreaterThan 7 exampleTree` counts nodes where tuple sums exceed 7.

-- Question 12:-- Using foldTree to create a new Tree by applying a transformation function
mapTreeFold :: (a -> b) -> Tree a -> Tree b
mapTreeFold f = foldTree (\pair left right -> Node (f pair) left right) Leaf

-- Example: `mapTreeFold doubleValues exampleTree` doubles each value in the tree tuples.
