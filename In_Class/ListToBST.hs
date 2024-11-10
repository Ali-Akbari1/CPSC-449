data BinaryTree = NilT | Node Int BinaryTree BinaryTree


addNode :: BinaryTree -> Int -> BinaryTree
addNode NilT x = Node x NilT NilT 
addNode (Node n leftTree rightTree) x
    | x > n     = Node n leftTree (addNode rightTree x)
    | otherwise = Node n (addNode leftTree x) rightTree

    
listToSearchTree :: [Int] -> BinaryTree -> BinaryTree
listToSearchTree [] t = t 
listToSearchTree (x:xs) t =
    listToSearchTree xs (addNode t x)