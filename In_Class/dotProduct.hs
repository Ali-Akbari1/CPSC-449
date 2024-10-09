type Vect = (Double, Double, Double)

dotProduct :: Vect -> Vect -> Double
dotProduct (x1,y1,z1) (x2,y2,z2) = x1*x2 + y1*y2 + z1*z2

main = do
    let v1 = (2,3,4)
    let v2 = (2,2,2)
    print (dotProduct v1 v2)