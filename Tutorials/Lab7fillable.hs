{-
Lists in Haskell are an essential data structure and come with a variety of operators for manipulation.
The `[]` syntax represents a list. For example, [1, 2, 3] is a list of integers.

The core list operators include:
- (:) - the cons operator: It adds an element to the front of a list.
  Example: 1 : [2, 3] -> [1, 2, 3]
- (++) - the list concatenation operator: It concatenates two lists.
  Example: [1, 2] ++ [3, 4] -> [1, 2, 3, 4]


-- implement custom (++):
-- [] ++ ys = ys                 -- If the first list is empty, return the second list
-- (x:xs) ++ ys = x : (xs ++ ys)  -- Prepend the head of the first list to the result of appending the tail
-}
append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : append xs ys 



{-
- (!!) - the indexing operator: It retrieves the element at a specific index.
  Example: [10, 20, 30] !! 1 -> 20 (indexing starts from 0)
-}

-- Custom indexing operator
indexAt :: [a] -> Int -> Maybe a
indexAt [] _    = Nothing
indexAt (x:_) 0  = Just x
indexAt (_:xs) n 
    | n < 0       = Nothing                    -- Return Nothing for negative indices
    | otherwise   = indexAt xs (n - 1)        -- Recursively index into the tail of the list


{-
Lists are defined in Haskell as an algebraic data type:

data [a] = [] | a : [a]

This defines a list as either an empty list `[]`, or a value `a` followed by another list `a : [a]`.

-}
-- 1. Create a custom list data type (MyList) and define common list functions for it.
data MyList a = Empty | Cons a (MyList a)
  deriving (Show)

-- Define a function to convert MyList back to a regular list.
fromMyList :: MyList a -> [a]
fromMyList Empty = []
fromMyList (Cons x xs) = x : fromMyList xs

-- 2. Write a function to zip two lists using a tuple (custom zip function).
zipMyList :: [a] -> [b] -> [(a, b)]
zipMyList [] _ = []
zipMyList _ [] = []
zipMyList (x:xs) (y:ys) = (x, y) : zipMyList xs ys

-- 3. Write a function to get the nth element of a list (recursive version).
nthElement :: [a] -> Int -> Maybe a
nthElement [] _ = Nothing
nthElement (x:_) 0 = Just x
nthElement (_:xs) n = nthElement xs (n - 1)


-- 4. Write a function to merge two sorted lists into one sorted list (Merge Sort step).
mergeSortedLists :: (Ord a) => [a] -> [a] -> [a]
mergeSortedLists [] ys = ys
mergeSortedLists xs [] = xs
mergeSortedLists (x:xs) (y:ys)
  | x < y     = x : mergeSortedLists xs (y:ys)
  | otherwise = y : mergeSortedLists (x:xs) ys

-- 5. Define a function that returns the string associated with the maximum integer in the list of tuples
getMaxString :: [(String, Int)] -> String
getMaxString [] = ""  -- Return an empty string for an empty list
getMaxString [(s, _)] = s  -- If the list has one element, return its string
getMaxString ((s1, n1):(s2, n2):xs)
  | n1 >= n2  = getMaxString ((s1, n1) : xs)  
  | otherwise = getMaxString ((s2, n2) : xs)  

-- 6. Write a function to interleave two lists together.
interleaveLists :: [a] -> [a] -> [a]
interleaveLists [] ys = ys
interleaveLists xs [] = xs
interleaveLists (x:xs) (y:ys) = x : y : interleaveLists xs ys

-- 7. Write a function that checks if a list of tuples contains any tuple with the same first and second element.
hasEqualElements :: (Eq a) => [(a, a)] -> Bool
hasEqualElements [] = False
hasEqualElements ((x, y):xs)
  | x == y    = True
  | otherwise = hasEqualElements xs

-- 8. Write a function to reverse a list
reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]


--Prelude concat
--concat :: [[a]] -> [a]
--concat [[1, 2], [3, 4], [5]]  -- Result: [1, 2, 3, 4, 5]


-- 9. Write a custom concat
flatten :: [[a]] -> [a]
flatten [] = []
flatten (x:xs) = x ++ flatten xs



-- 10. Write a function to insert an element into its correct position in a sorted list
insertSorted :: (Ord a) => a -> [a] -> [a]
insertSorted x [] = [x]
insertSorted x (y:ys)
  | x <= y = x : y : ys
  | otherwise = y : insertSorted x ys


-- 11. Find all sublists of a list 
sublists :: [a] -> [[a]]
sublists [] = [[]]
sublists (x:xs) = sublists xs ++ addToAll x (sublists xs)
  where
    addToAll _ [] = []
    addToAll y (z:zs) = (y:z) : addToAll y zs