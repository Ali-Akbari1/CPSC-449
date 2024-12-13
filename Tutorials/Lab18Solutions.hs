-- Lazy Evaluation
-- -------------------
-- Haskell uses lazy evaluation, meaning expressions are not evaluated until their values are needed.
-- This allows infinite data structures and can improve efficiency by avoiding unnecessary computations.
-- However, it also means you need to think carefully about when and how evaluation occurs to avoid issues like space leaks.

-- 1. Define an infinite list of all natural numbers (0, 1, 2, 3, ...).
--    Use this list to write a function `takeEvenNumbers` that takes the first `n` even numbers from the list.

infiniteNaturals :: [Int]
infiniteNaturals = [0..]  -- Infinite list of natural numbers starting from 0

takeEvenNumbers :: Int -> [Int]
takeEvenNumbers n = take n (filter even infiniteNaturals)  -- Take the first n even numbers

-- 2. Define a function `sumToN` that lazily computes the sum of the first `n` natural numbers.
--    Use the infinite list `infiniteNaturals` in your implementation.

sumToN :: Int -> Int
sumToN n = sum (take n infiniteNaturals)  -- Sum the first n natural numbers

-- 3. Lazy evaluation allows for conditional processing of infinite lists.
--    Define a function `findFirstMultiple` that finds the first number in an infinite list
--    that is a multiple of a given number `k`.

findFirstMultiple :: Int -> Int
findFirstMultiple k = head (filter (\x -> x `mod` k == 0) infiniteNaturals)

-- 4. Haskell's laziness can sometimes lead to inefficiencies. Define a recursive list `fibs`
--    of Fibonacci numbers using laziness, and write a function `nthFib` to find the nth Fibonacci number.

fibs :: [Int]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)  -- Define Fibonacci sequence lazily

nthFib :: Int -> Int
nthFib n = fibs !! n  -- Access the nth Fibonacci number using indexing

-- 5. Implement the Sieve of Eratosthenes lazily.

primes :: [Int]
primes = sieve [2..]  -- Start with the list of all integers from 2 onwards
  where
    sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]
    -- Take the first number as a prime, filter out all multiples of it, and recurse