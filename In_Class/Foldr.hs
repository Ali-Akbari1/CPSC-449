myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f initVal []     = initVal
myFoldr f initVal (x:xs) = f x (myFoldr f initVal xs)