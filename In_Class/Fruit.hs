
data Fruit = Apple | Banana | Orange 

instance Eq Fruit where 
    Apple == Apple = True 
    Banana == Banana = True
    Orange == Orange = True
    _ == _ = False 

instance Show Fruit where 
    show fruit = case fruit of 
        Apple -> "An apple"
        Banana -> "A banana! Yum!"
        Orange -> "Yuck an Orange."

main = do 
    print (show Banana)
    print (show Orange)
    print ((==) Apple Orange)