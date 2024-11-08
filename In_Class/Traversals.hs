data BinaryTree = NilT | Node Int BinaryTree BinaryTree

inOrder :: BinaryTree -> [Int]
inOrder NilT = []
inOrder (Node value left right) = inOrder left ++ [value] ++ inOrder right

preOrder :: BinaryTree -> [Int]
preOrder NilT []
preOrder (Node value left right) = value : preOrder
    left ++ preOrder right


postOrder :: BinaryTree -> [Int]
postOrder NilT []
postOrder (Node value left right) = postOrder left ++ postOrder right ++ [value]

