
-- Function to find the binomial coefficient
binomial :: Int -> Int -> Int 
binomial n k = binomial (n-1) (k-1)*n*((n-k)+1) div k