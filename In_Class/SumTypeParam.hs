data Shape = Circle Float | Rect Float Float 

area :: Shape -> Float 
area (Circle r) = pi * r * r
area (Rect w h) = w * h

myCr :: Shape 
myCr = Circle 5.0

myRect :: Shape
myRect = Rect 2.0 4.0 

main :: IO ()
main = do
    print $ area myCr
    print $ area myRect