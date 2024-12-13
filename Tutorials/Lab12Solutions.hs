{-
In Haskell, fold is a higher-order function used to reduce a data structure (usually a list) to a single value.
It does so by recursively applying a function to elements of the structure and an accumulator.
There are two primary kinds of folds in Haskell: foldr (fold right) and foldl (fold left).
1. foldr (fold right)
foldr processes the list from right to left.
It recursively applies a binary function to the last element of the list and an accumulator, then moves to the previous element, continuing this process until the list is exhausted.

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z xs =>
 - f is the function that takes two arguments: an element from the list and the accumulated result.
 - z is the initial accumulator (also called the "base case" or "starting value").
 - xs is the list to be folded.

2. foldl (fold left):
foldl processes the list from left to right.
It starts with the first element and the accumulator, then applies the function and proceeds to the next element, carrying the accumulated result along.

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f z xs
 - f is the function that takes two arguments: the accumulator and the next element from the list.
 - z is the initial accumulator.
 - xs is the list to be folded.
-}

-- 1. Write a function using fold to compute the factorial of n
fac :: Int -> Int
fac n = foldr (*) 1 [1 .. n]

-- 2. define a function to get the sum of the squares of the numbers 1 to n using map and foldr
sumSquares :: Int -> Int
sumSquares n = foldr (+) 0 (map (^ 2) [1 .. n])

-- 3. Write a function using foldr to compute the length of a list.
myLength :: [a] -> Int
myLength xs = foldr (\_ i -> i + 1) 0 xs

-- 4. Write your own version of map using foldr.
myMap :: (a -> b) -> [a] -> [b]
myMap f xs = foldr (\x acc -> f x : acc) [] xs

-- 5. Write your own version of filter using foldr.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p xs = foldr (\x acc -> if p x then x : acc else acc) [] xs

-- 6. Write a function using foldr that flattens a list of lists into a single list.
flatten :: [[a]] -> [a]
flatten xs = foldr (++) [] xs

-- 7. Write a function using foldr that counts how many times a given element appears in a list.
countOccurrences :: Eq a => a -> [a] -> Int
countOccurrences x xs = foldr (\x' i -> if x == x' then i + 1 else i) 0 xs

-- 8. Write a function using foldr that checks if all elements in a list satisfy a condition (like 'all' in Prelude)
myAll :: (a -> Bool) -> [a] -> Bool
myAll p xs = foldr (\x b -> p x && b) True xs

-- 9. Using fold, define a function filterFirst so that filterFirst p xs removes the first element of xs which does not have the property p
filterFirst :: (a -> Bool) -> [a] -> [a]
filterFirst p xs =
  fst
    ( foldl
        ( \(acc, found) x ->
            if not found
              then if p x then (acc ++ [x], False) else (acc, True)
              else (acc ++ [x], found)
        )
        ([], False)
        xs
    )

-- 10. Can you define a function filterLast which removes the last occurrence of an element of a list without property p?
filterLast :: (a -> Bool) -> [a] -> [a]
filterLast p xs =
  fst
    ( foldr
        ( \x (acc, found) ->
            if not found
              then if p x then (x : acc, False) else (acc, True)
              else (x : acc, found)
        )
        ([], False)
        xs
    )

-- 11. Can you define filterLast using filterFirst?
filterLast' :: (a -> Bool) -> [a] -> [a]
filterLast' p xs = reverse (filterFirst p (reverse xs))

-- Sum Types

-- I) Introduction to Sum Types
-- ----------------------------
-- Sum types are types that allow a value to be one of several different types.
-- They are defined using the `data` keyword and the `|` symbol to represent multiple variants.
-- For example:
--
-- data Shape = Circle Float | Rectangle Float Float
--
-- This allows values of type `Shape` to be either a `Circle` with a radius or a `Rectangle`
-- with a width and height.
--
-- You can pattern match on sum types to handle each variant accordingly. For example:
--
-- area :: Shape -> Float
-- area (Circle r) = pi * r * r
-- area (Rectangle w h) = w * h

-- 1. Define a sum type called `Vehicle` that can represent either a `Car` with a number of doors,
-- or a `Bicycle` with the number of gears.

data Vehicle = Car Int | Bicycle Int -- Complete this definition
  deriving (Show)

-- 2. Define a function `describeVehicle` that takes a `Vehicle` and returns a description
-- of the vehicle as a string. For example:
--    describeVehicle (Car 4) should return "This car has 4 doors."
--    describeVehicle (Bicycle 8) should return "This bicycle has 8 gears."

describeVehicle :: Vehicle -> String
describeVehicle (Car n) = "This car has " ++ show n ++ " doors."
describeVehicle (Bicycle n) = "This bicycle has " ++ show n ++ " gears."

-- 3. Define a sum type `Operation` that can represent either an `Add` operation with two integers,
-- a `Subtract` operation with two integers, or a `Multiply` operation with two integers.

data Operation = Add Int Int | Sub Int Int | Mult Int Int -- Complete this definition
  deriving (Show)

-- 4. Define a function `evaluateOperation` that takes an `Operation` and returns the result
-- of performing the operation as an integer. For example:
--    evaluateOperation (Add 3 4) should return 7.
--    evaluateOperation (Multiply 2 5) should return 10.

evaluateOperation :: Operation -> Int
evaluateOperation (Add a b) = a + b
evaluateOperation (Sub a b) = a - b
evaluateOperation (Mult a b) = a * b

-- 5. Define a recursive sum type `Tree` that can represent either an empty tree (use `Empty`),
-- or a node containing an integer value and two subtrees (use `Node`).

data Tree = Empty | Node Int Tree Tree
  deriving (Show)

-- 6. Define a function `sumTree` that takes a `Tree` and returns the sum of all the integers in the tree.
-- For example:
--    sumTree (Node 3 (Node 1 Empty Empty) (Node 4 Empty Empty)) should return 8.

sumTree :: Tree -> Int
sumTree Empty = 0
sumTree (Node val t1 t2) = val + sumTree t1 + sumTree t2