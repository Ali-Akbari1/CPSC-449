-- Ali Akbari 30171539
-- Assignment 2 


--Question 1
-- Function that takes a matrix and returns its transpose
transposeMatrix :: [[a]] -> [[a]]
transposeMatrix ([]:_) = []  -- Base case: if the first row is empty, return an empty list
transposeMatrix matrix = map head matrix : transposeMatrix (map tail matrix) -- Recursive case: extract the first column using map head and recursively transpose the rest

--Question 2
-- Group elements by a predicate (separate list elements based on a condition)
groupByPredicate :: (a -> Bool) -> [a] -> [[a]]
groupByPredicate _ [] = []  -- If the input list is empty, return an empty list
groupByPredicate predicate (x:xs) = go predicate xs [[x]] -- Start grouping by taking the first element and recursively grouping the rest
  where
    go _ [] result = map reverse (reverse result)  -- Once all elements are processed, return the reversed result
    go p (y:ys) (currGroup:restGroups)
      | p y == p (head currGroup) = go p ys ((y:currGroup):restGroups)  -- If the predicate result is the same as the current group's head, add to that group
      | otherwise                 = go p ys ([y]:currGroup:restGroups)  -- If the predicate result differs, start a new group with the current element


--Question 3
-- Movie data structure 
data Movie = Movie { title :: String, rating :: Float, genre :: String } deriving Show

-- Define a list of movies with titles, ratings, and genres
movies :: [Movie]
movies = [Movie "Inception" 8.8 "Sci-Fi"
          , Movie "The Matrix" 8.7 "Sci-Fi"
          , Movie "Jaws" 7.9 "Thriller"
          , Movie "Frozen" 7.4 "Animation"
          , Movie "Interstellar" 8.6 "Sci-Fi"
          , Movie "The Godfather" 9.7 "Crime"
          , Movie "Toy Story" 8.3 "Animation"
          ]


-- topRatedMovies function that returns movies with a rating above a threshold
topRatedMovies :: [Movie] -> Float -> [String]

-- Filter movies by rating and return a list of their titles
topRatedMovies movies threshold = map title (filter (\m -> rating m > threshold) movies)

-- moviesByGenre Function that reutrns movies of a specific genre
moviesByGenre :: [Movie] -> String -> [String]

-- Filter movies by genre and return a list of their titles
moviesByGenre movies g = map title (filter (\m -> genre m == g) movies)

-- adjustedRatings Function that adjusts the ratings of movies by adding 0.5 
adjustedRatings :: [Movie] -> [Movie]

-- Apply adjustRating to each movie in the list
adjustedRatings = map adjustRating
  where

    -- For each movie, increase the rating by 0.5 but cap it at 10.0
    adjustRating m = m { rating = min 10.0 (rating m + 0.5) }


--Question 4
-- mergeSort Function that implements mergeSort
mergeSort :: Ord a => [a] -> [a]
mergeSort []  = [] -- Base case: an empty list is already sorted
mergeSort [x] = [x] -- Base case: a single element list is already sorted

-- Recursive case: sort the left and right halves and then merge them
mergeSort xs  = merge (mergeSort left) (mergeSort right)
  where
    (left, right) = halve xs  -- Split the list into two halves


-- Function to split the list into two halves
halve :: [a] -> ([a], [a])
halve []  = ([], []) -- Base case: an empty list is split into two empty lists
halve [x] = ([x], [])  -- Base case: a single element list is split with one half empty
halve (x:y:xs) = (x:left, y:right) -- Recursively split the rest of the list
  where
    (left, right) = halve xs -- Continue halving the remaining list


-- Merge two sorted lists into one sorted list
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys -- Base case: if one list is empty, return the other list
merge xs [] = xs -- Base case: if the other list is empty, return the first list
merge (x:xs) (y:ys)
  | x <= y    = x : merge xs (y:ys) -- If the first element of the first list is smaller, use it
  | otherwise = y : merge (x:xs) ys -- If the first element of the second list is smaller, use it
