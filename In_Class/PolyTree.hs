data BinaryTree a = NilT | Node a (BinaryTree a) (BinaryTree a)


inTree :: (Ord a) => (BinaryTree a) -> a -> Bool 
inTree NilT _ = False 
inTree (Node x leftTree rightTree) y 
    | x == y    = True 
    | otherwise = inTree leftTree y || inTree rightTree y


addNode :: (Ord a) => (BinaryTree a) -> a -> BinaryTree a
addNode NilT x = Node x NilT NilT 
addNode (Node n leftTree rightTree) x
    | x > n     = Node n leftTree (addNode rightTree x)
    | otherwise = Node n (addNode leftTree x) rightTree


    
listToSearchTree :: (Ord a) => [a] -> BinaryTree a -> BinaryTree a
listToSearchTree [] t = t 
listToSearchTree (x:xs) t =
    listToSearchTree xs (addNode t x)