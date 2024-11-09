myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f initVal []     = initVal
myFoldr f initVal (x:xs) = f x (myFoldr f initVal xs)

rev :: [a] -> [a] -> [a]
rev xs initial = foldr snoc initial xs 

snoc :: a -> [a] -> [a]
snoc x xs = xs ++ [x]