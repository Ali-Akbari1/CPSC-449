-- 1
data Coord = C Integer Integer

instance Show Coord where
    show (C x y) = "C " ++ show x ++ " " ++ show y

instance Eq Coord where
    (C x1 y1) == (C x2 y2) = x1 == x2 && y1 == y2

instance Num Coord where
    (C x1 y1) + (C x2 y2) = C (x1 + x2) (y1 + y2)
    (C x1 y1) - (C x2 y2) = C (x1 - x2) (y1 - y2)
    (C x1 y1) * (C x2 y2) = C (x1 * x2) (y1 * y2)
    negate (C x y) = C (negate x) (negate y)
    abs (C x y) = C (abs x) (abs y)
    signum (C x y) = C (signum x) (signum y)
    fromInteger n = C n n

-- 1.5 Now implement a typeclass called OriginDistance which contains a function declaration called
-- distanceFromOrigin which takes some polymorphic input and returns a double
class OriginDistance a where
     distanceFromOrigin :: a -> Double

-- 1.6 Now implement your own instance of the OriginDistance typeclass on the Coord data type with a 
-- definition of the distanceFromOrigin function which uses the 
instance OriginDistance Coord where 
    distanceFromOrigin :: Coord -> Double
    distanceFromOrigin (C x y) = sqrt (fromIntegral (x*x + y*y))


-- 2

-- Define a linked list data type
data LinkedList a = Nil | Cons a (LinkedList a)
  deriving (Show)

-- Implement a function to reverse the linked list
reverseList :: LinkedList a -> LinkedList a
reverseList list = reverseHelper list Nil
  where
    reverseHelper :: LinkedList a -> LinkedList a -> LinkedList a
    reverseHelper Nil acc = acc
    reverseHelper (Cons x xs) acc = reverseHelper xs (Cons x acc)

-- Helper function to create a list from a regular Haskell list
fromList :: [a] -> LinkedList a
fromList = foldr Cons Nil

-- Function to convert a linked list back to a regular Haskell list (for easier testing)
toList :: LinkedList a -> [a]
toList Nil = []
toList (Cons x xs)  = x : toList xs
