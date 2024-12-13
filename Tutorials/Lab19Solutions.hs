-- Type Checking
-- ------------------
-- Haskell has a strong, static type system. The type of every expression is known at compile time.
-- Use `:type` or `:t` in GHCi to check the type of expressions. The following exercises are designed to
-- deepen your understanding of Haskell's type system.

-- 1. Define a polymorphic function `alwaysTrue` that works for any type and always returns `True`.
--    Example: alwaysTrue 5, alwaysTrue "hello" -> True

alwaysTrue :: a -> Bool
alwaysTrue _ = True  -- Always returns True regardless of input

-- 2. Define a function `applyTwice` that takes a function and an argument, and applies the function twice.
--    Example: applyTwice (*2) 3 -> 12

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)  -- Applies the function `f` twice

-- 3. The type of a function can guide how it must behave.
--    Write a function `idList` that takes a list and returns the same list without inspecting its elements.
--    Example: idList [1,2,3] -> [1,2,3]

idList :: [a] -> [a]
idList xs = xs  -- Returns the input list unchanged

-- 4. Haskell supports higher-kinded types. Define a function `mapMaybe` that behaves like `map`,
--    but works for the `Maybe` type. 
--    Example: mapMaybe (+1) (Just 5) -> Just 6
--             mapMaybe (+1) Nothing -> Nothing

mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe f (Just x) = Just (f x)  -- Apply the function if there's a value
mapMaybe _ Nothing  = Nothing     -- Return Nothing if input is Nothing

-- 5. Write a type signature for a function `composeThree` that composes three functions.
--    The function itself is already defined for you. Add the correct type signature.

composeThree :: (b -> c) -> (a -> b) -> (x -> a) -> x -> c
composeThree f g h x = f (g (h x))  -- Compose three functions

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
applyIfTrue cond f x
  | cond      = f x  -- If the condition is True, apply the function
  | otherwise = x    -- If the condition is False, return the value unchanged

-- 7. Using the `primes` list from before, implement a `twinPrimes` list which is a list
--    of all tuples containing prime numbers (p, q) such that q - p = 2.
--    Example:
--      take 3 twinPrimes -> [(3, 5), (5, 7), (11, 13)]

primes :: [Int]
primes = sieve [2..]
  where
    sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

twinPrimes :: [(Int, Int)]
twinPrimes = [(p, q) | (p, q) <- zip primes (tail primes), q - p == 2]
    -- Generate all twin primes as a list of pairs