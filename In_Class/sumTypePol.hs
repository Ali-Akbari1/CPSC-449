data Student = Student {name :: String, grade :: Int}
instance Eq Student where
    (Student nameA gradeA) == (Student nameB gradeB) =
        nameA == nameB && gradeA == gradeB 
    (Student nameA gradeA) /= (Student nameB gradeB) = 
        nameA /= nameB || gradeA /= gradeB

std1 = Student "Tom" 90 
std2 = Student "Tom" 90 
std3 = Student "Tom" 95

main = do 
    print (std1 == std2)
    print (std1 == std3)
    print (name std1)