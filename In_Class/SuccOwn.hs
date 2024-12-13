data State = Silly | Nice | None 
    deriving (Show, Eq)

instance Enum State where 
    toEnum 0 = Silly 
    toEnum 1 = Nice 
    toEnum 2 = None 
    toEnum _ = error "State.toEnum: out of bounds"

    fromEnum Silly = 0
    fromEnum Nice = 1 
    fromEnum None = 2

x = Silly 
y = succ x 

main = print y