
allEqual :: Eq a => a -> a -> a -> Bool
allEqual x y z = (x == y) && (y == z)
