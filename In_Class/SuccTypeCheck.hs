data State = Silly | Nice | None 
    deriving (Show, Enum)

x = Silly 
y = succ x 
main = print y