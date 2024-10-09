addLists :: [Int]->[Int]->[Int]
addLists x y = [a+b| a <- x, b <- y]
main = print (addLists [1,2,4] [4,5,6])