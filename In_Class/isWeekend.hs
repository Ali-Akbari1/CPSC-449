data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun 
  deriving (Show)

isWeekend :: Day -> Bool
isWeekend Sat = True
isWeekend Sun = True
isWeekend _ = False


-- Example usage:
main :: IO ()
main = do
  let d = Wed
  print d
