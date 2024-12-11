f :: Int -> Int 
f grade = 2*grade

g:: Int -> Int 
g grade = grade + 10

h = f.g 

main = print $ h 50