
data LetGrade = LetF | LetD | LetC | LetB | LetA
    deriving Show

type Grade = Int

gradeToLetter :: Grade -> LetGrade
gradeToLetter grade 
    | grade >= 90 && grade < 100 = LetA
    | grade >= 80 && grade < 90 = LetB
    | grade >= 70 && grade < 80 = LetC
    | grade >= 60 && grade < 70 = LetD
    | grade >= 0 && grade < 60 = LetF
main = do
    print(gradeToLetter 90)
    print(gradeToLetter 50)