data BinaryTree = NilT | Node Int BinaryTree BinaryTree

height :: BinaryTree -> Int 
height NilT = 0 
height (Node _ left right) = 1 + max (height left) (height right)

sumTree :: BinaryTree -> Int 
sumTree NilT           = 0
sumTree (Node n t1 t2) = n + sumTree t1 + sumTree t2 

inTree :: BinaryTree -> Int -> Bool 
inTree NilT _ = False 
inTree (Node x leftTree rightTree) y 
    | x == y    = True 
    | otherwise = inTree leftTree y || inTree rightTree y 

myTree = Node 42
         (Node 13 NilT NilT)
         (Node 19 NilT
            (Node 12 NilT NilT))

main = do 
    print (height myTree)
    print (sumTree myTree)