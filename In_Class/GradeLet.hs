
data LetGrade = LetF | LetD | LetC | LetB | LetGrade
    deriving show

type Grade = Int

GradeToLetter :: Grade -> LetGrade
GradeToLetter grade 
    | grade >= 90 && grade < 100 = LetA
    | grade >= 80 && grade < 90 = LetB
    | grade >= 70 && grade < 80 = LetC
    | grade >= 60 && grade < 70 = LetD
    | grade >= 0 && grade < 60 = LetF
main = do
    print(GradeToLetter 90)
    print(GradeToLetter 50)