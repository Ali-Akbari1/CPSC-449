-- Ali Akbari 30171539
-- Assignment 1 Question 2


-- Function to find the binomial coefficient
binomial :: Int -> Int -> Int

-- Base case n choose 0 is 1
binomial n 0 = 1  
binomial n k
    | k > n     = 0      -- If k > n, return 0 
    | k > n - k = binomial n  (n - k) -- If k > n - k, use symmetry property: n choose k = n choose (n - k)
    | otherwise = (binomial n (k - 1) * (n - k + 1)) `div` k -- otherwise use binomial formula