

cToF :: Float -> Float 
cToF c = c * 1.8 + 3.2

myMap :: (Float -> Float) -> [Float] -> [Float]
myMap fFun cList = [ fFun temp | temp <- cList]

main = print(myMap cToF [20.0, 30.0, 0.0, -10.0])