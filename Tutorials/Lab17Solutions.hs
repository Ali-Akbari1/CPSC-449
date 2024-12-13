data BinaryTree a = Empty | Node a (BinaryTree a) (BinaryTree a)
  deriving (Show, Eq)

-- Implement a function to calculate the depth of the tree
treeDepth :: BinaryTree a -> Int
treeDepth Empty = 0
treeDepth (Node _ left right) = 1 + max (treeDepth left) (treeDepth right)

-- Implement a function to calculate the depth of the tree
inOrder :: BinaryTree a -> [a]
inOrder Empty = []
inOrder (Node value left right) = inOrder left ++ [value] ++ inOrder right

-- Write a function to find the sum of all left leaves in a binary tree.
sumLeftLeaves :: Num a => BinaryTree a -> a
sumLeftLeaves = go False
  where
    go _ Empty = 0
    go isLeft (Node x Empty Empty) = if isLeft then x else 0
    go _ (Node _ left right) = go True left + go False right

-- Implement a function to check if two binary trees are identical.
areIdentical :: Eq a => BinaryTree a -> BinaryTree a -> Bool
areIdentical Empty Empty = True
areIdentical (Node x1 left1 right1) (Node x2 left2 right2) =
  x1 == x2 && areIdentical left1 left2 && areIdentical right1 right2
areIdentical _ _ = False

-- Implement a function which checks whether or not a specific item is found in a binary tree and returns the level
contains :: Eq a => a -> BinaryTree a -> (Bool, Maybe Int)
contains x tree = containsHelper x tree 1

containsHelper :: Eq a => a -> BinaryTree a -> Int -> (Bool, Maybe Int)
containsHelper _ Empty _ = (False, Nothing)
containsHelper x (Node value left right) level
    | x == value = (True, Just level)
    | otherwise  = case containsHelper x left (level + 1) of
                     (True, l) -> (True, l)
                     _         -> containsHelper x right (level + 1)

-- Implement a function to determine whether a binary tree is balanced or not
isBalanced :: BinaryTree a -> Bool
isBalanced tree = balancedHeight tree /= -1

balancedHeight :: BinaryTree a -> Int
balancedHeight Empty = 0
balancedHeight (Node _ left right) =
    let leftHeight = balancedHeight left
        rightHeight = balancedHeight right
    in if leftHeight == -1 || rightHeight == -1 || abs (leftHeight - rightHeight) > 1
       then -1
       else 1 + max leftHeight rightHeight