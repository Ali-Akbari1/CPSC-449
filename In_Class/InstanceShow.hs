data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun
instance Show Day where 
    show Mon = "Monday"
    show Tue = "Tuesday"
    show Wed = "Wednesday"
    show Thu = "Thursday"
    show Fri = "Friday"
    show Sat = "Saturday"
    show Sun = "Sunday"
silly = show Mon
main = putStrLn (show Thu)
--main = putStrLn silly