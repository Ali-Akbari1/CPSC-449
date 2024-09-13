data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun 

isWeekend :: Day -> Bool
isWeekend Sat = True
isWeekend Sun = True
isWeekend _ = False
