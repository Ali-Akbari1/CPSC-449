-- Type Checking
-- ------------------
-- Haskell has a strong, static type system. The type of every expression is known at compile time.
-- Use `:type` or `:t` in GHCi to check the type of expressions. The following exercises are designed to
-- deepen your understanding of Haskell's type system.

-- 1. Define a polymorphic function `alwaysTrue` that works for any type and always returns `True`.
--    Example: alwaysTrue 5, alwaysTrue "hello" -> True

alwaysTrue :: a -> Bool
alwaysTrue = undefined  -- Complete this function

-- 2. Define a function `applyTwice` that takes a function and an argument, and applies the function twice.
--    Example: applyTwice (*2) 3 -> 12

applyTwice :: (a -> a) -> a -> a
applyTwice f x = undefined  -- Complete this function

-- 3. The type of a function can guide how it must behave.
--    Write a function `idList` that takes a list and returns the same list without inspecting its elements.
--    Example: idList [1,2,3] -> [1,2,3]

idList :: [a] -> [a]
idList xs = undefined  -- Complete this function

-- 4. Haskell supports higher-kinded types. Define a function `mapMaybe` that behaves like `map`,
--    but works for the `Maybe` type. 
--    Example: mapMaybe (+1) (Just 5) -> Just 6
--             mapMaybe (+1) Nothing -> Nothing

mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe f ma = undefined  -- Complete this function

-- 5. Write a type signature for a function `composeThree` that composes three functions.
--    The function itself is already defined for you. Add the correct type signature.

composeThree f g h x = f (g (h x))  -- Add the type signature here

-- 6. Define a function `applyIfTrue` that takes:
--    - A boolean value (`Bool`),
--    - A function (`a -> a`),
--    - And a value (`a`).
--    If the boolean is `True`, the function should apply the given function to the value.
--    Otherwise, it should return the value unchanged.
--    Example:
--      applyIfTrue True (*2) 5 -> 10
--      applyIfTrue False (*2) 5 -> 5

applyIfTrue :: Bool -> (a -> a) -> a -> a
applyIfTrue = undefined  -- Complete this function

-- 7. Using the `primes` list from before, implement a `twinPrimes` list which is a list
--    of all tuples containing prime numbers (p, q) such that p - q = 2.
--    Example:
--      take 3 twinPrimes -> [(3, 5), (5, 7), (11, 13)]

primes :: [Int]
primes = sieve [2..]
  where
    sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

twinPrimes :: [(Int, Int)]
twinPrimes = undefined -- Complete this definition