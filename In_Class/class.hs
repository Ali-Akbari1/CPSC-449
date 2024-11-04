class Info a where
    examples :: [a]
    size     :: a -> Int
    