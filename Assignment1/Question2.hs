-- Ali Akbari 30171539
-- Assignment 1 Question 2


-- Function to find the binomial coefficient
binomial :: Int -> Int -> Int
binomial n 0 = 1  -- Base case: C(n, 0) = 1
binomial n k
    | k == 0    = 1  -- Base case: C(n, 0) = 1
    | k > n     = 0  -- If k > n, return 0 
    | k > n - k = binomial n  (n - k)
    | otherwise = (binomial n (k - 1) * (n - k + 1)) `div` k