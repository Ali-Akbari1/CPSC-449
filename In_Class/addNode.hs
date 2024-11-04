data BinaryTree = NilT | Node Int BinaryTree BinaryTree

inTree :: BinaryTree -> Int -> Bool
inTree NilT _ = False
inTree (Node x leftTree rightTree) y
    | x == y    = True
    | otherwise = inTree leftTree y || inTree rightTree y

addNode :: BinaryTree -> Int -> BinaryTree
addNode NilT x = Node x NilT NilT 
addNode (Node n leftTree rightTree) x
    | x > n     = Node n leftTree (addNode rightTree x)
    | otherwise = Node n (addNode leftTree x) rightTree

myTree = Node 25 NilT 
                 (Node 50 NilT
                          (Node 75 (Node 60 NilT NilT) NilT))

main = do
    print(inTree myTree elem)
    print(inTree newTree 10)