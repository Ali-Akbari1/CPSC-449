-- Question 1
processNestedList :: [[Int]] -> [Int]
-- write your code here -- 

fst' :: (a, b) -> a
fst' = -- curry or uncurry --
        (\ x y -> 
            -- x or y --
            )

snd' :: (a, b) -> b
snd' = -- curry or uncurry --
        (\ x y -> 
            -- x or y --
            )

-- Question 2
matrixAddition :: [[Int]] -> [[Int]] -> [[Int]]
-- write your code here --

scalarMultiply :: Int -> [[Int]] -> [[Int]]
-- write your code here --

matrixTrace :: [[Int]] -> Int
-- write your code here --

-- Question 3
class Shape a where
    area :: a -> Double
data Circle = Circle Double
data Rectangle = Rectangle Double Double

instance Shape Circle where
    area -- write your code here --

instance Shape Rectangle where
    area -- write your code here --

-- Question 4
data AVLTree a = Empty | Node a (AVLTree a) (AVLTree a)

heightAVL :: AVLTree a -> Int
-- write your code here --

isOrdered :: (Ord a) => AVLTree a -> Bool
-- write your code here --

isBalanced :: AVLTree a -> Bool
-- write your code here --
