listToSearchTree :: [Int] -> BinaryTree -> BinaryTree
listToSearchTree [] t = t 
listToSearchTree (x:xs) t =
    listToSearchTree xs (addNode t x)