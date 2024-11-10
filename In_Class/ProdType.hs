data Shape = Circle Float | Rectangle Float Float | Triangle Float Float Float 

area :: Shape -> Float 
area (Circle r) = 3.14 * r * r 
area (Rectangle w h) = w * h 