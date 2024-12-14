{-
Currying:
Currying refers to transforming a function that takes multiple arguments into a sequence of functions, each taking a single argument.
In Haskell, all functions are curried by default.
This means that a function that appears to take multiple arguments is actually a series of nested functions, each taking one argument at a time.
For example, the following function seems to take two arguments:
add :: Int -> Int -> Int
add x y = x + y
But in reality, add is curried. It is equivalent to:
add :: Int -> (Int -> Int)
add x = \y -> x + y
This means add first takes an argument x and returns a new function \y -> x + y, which expects the second argument y.
You can call it like this:
add 2 3 -- Returns 5
Or partially apply it:
add_2 = add 2
add_2 3 -- Returns 5
--------------------------------------------------------------------------------------------------------------------------
Uncurrying:
Uncurrying is the reverse of currying.
It transforms a curried function into a function that takes a tuple of arguments instead of taking them one by one.
Haskell provides a standard function uncurry that does this:
uncurry :: (a -> b -> c) -> (a, b) -> c
If we apply uncurry to our add function, we get:
uncurriedAdd = uncurry add
uncurriedAdd (2, 3) -- Returns 5
-}

-- 1. Define a curried function addToAll that adds a number to each element of a list:
addToAll :: Int -> [Int] -> [Int]
addToAll n = map (+ n)

-- 2. Define a curried function doubleAll that doubles all the elements of a list:
doubleAll :: [Int] -> [Int]
doubleAll = map (* 2)

-- 3. Define a curried function addOneFilterPos which adds one to each member of a list, and then removes those elements which are not positive.
-- use function composition
addOneFilterPos :: [Int] -> [Int]
addOneFilterPos = filter (> 0) . map (+ 1)

-- 4. Define a curried function getEvens which takes a list of numbers and filters the odd ones
getEvens :: [Int] -> [Int]
getEvens = filter even
-- getEvens = filter ((== 0) . (`mod` 2))

-- 5. define a function curry3 that performs the analogue of curry but for three arguments
curry3 :: ((a, b, c) -> d) -> a -> b -> c -> d
curry3 f = \a b c -> f (a, b, c)

-- 6. define a function uncurry3 that performs the analogue of uncurry but for three arguments
uncurry3 :: (a -> b -> c -> d) -> ((a, b, c) -> d)
uncurry3 f = \(a, b, c) -> f a b c

-- 7. define a function curryList that performs the analogue of curry but for a list of arguments
curryList :: ([a] -> d) -> (a -> [a] -> d)
curryList f = \x xs -> f (x : xs)

-- 8. define a function uncurryList that performs the analogue of uncurry but for a list of arguments
uncurryList :: (a -> [a] -> d) -> ([a] -> d)
uncurryList f = \(x : xs) -> f x xs

-- 9. Define a function swi tchMap which maps two functions along a list, alternating which to apply.
-- For example, switchMap (+1) (+10) [1,2,3,4] = [2,12,4,14]
switchMap :: (a -> b) -> (a -> b) -> [a] -> [b]
switchMap f g = (\(x, y, z) -> x) . foldl (\(acc, f1, f2) x -> (acc ++ [f1 x], f2, f1)) ([], f, g)

-- 10. Implement the quick sort function
qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x : xs) = qsort smallerOrEqual ++ [x] ++ qsort larger
  where
    larger = filter (> x) xs
    smallerOrEqual = filter (<= x) xs
