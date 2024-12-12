isSingleton :: [a] -> Bool
isSingleton [_] = True   -- Match a list with exactly one element
isSingleton _   = False  -- Match any other list (empty or with more elements)
