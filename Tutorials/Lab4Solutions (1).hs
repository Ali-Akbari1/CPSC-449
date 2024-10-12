-- Mastering Conditional Logic: If-Else Statements and Guards

{- In Haskell, when using guards, the first guard that evaluates to True is the one that gets 
 executed, and the subsequent guards are ignored. Haskell does not evaluate all guards once it 
 finds a True condition. However it is best practice to not use overlapping guard conditions
 in your codes as it might get confusing to navigate.
 
 The otherwise expression is often used as a catch-all for cases that don’t match any of the 
 previous guards. What other expression could you replace the otherwise expression with, so 
 that the behavior of the function remains the same? Write it in the integer sign checking
 function down below.
-}
signCheck :: Int -> String
signCheck a
  | a > 0           = "Positive"
  | a == 0          = "Zero"
  | True            = "Negative"

{- While both if-else and guards can be used to handle conditions in Haskell guards provide a
 more readable and structured approach for dealing with multiple conditions. If-else is useful
 for simpler decisions but can become inconvenient with complexity. But in the end, it is a 
 matter of personal preference and there is no machine-side advantage for going with one or the
 other.
-}

{- Write a function that takes the coordinates of a point x, y and determines which quadrant
 of the Cartesian plane the point is in. If the point is on an axis, return a specific message.
-}
quadrantCheck :: Double -> Double -> String
quadrantCheck x y
  | x > 0 && y > 0 = "First Quadrant"
  | x < 0 && y > 0 = "Second Quadrant"
  | x < 0 && y < 0 = "Third Quadrant"
  | x > 0 && y < 0 = "Fourth Quadrant"
  | x == 0 && y /= 0 = "On Y-axis"
  | y == 0 && x /= 0 = "On X-axis"
  | otherwise = "Origin"

{- Write a function that takes three sides of a triangle and determines if it is equilateral, 
 isosceles, or scalene.
-}
triangleType :: Int -> Int -> Int -> String
triangleType a b c =
  if a == b && b == c
    then "Equilateral"
    else if a == b || b == c || a == c
      then "Isosceles"
      else "Scalene"

{- Now that we know about the conditional operators let's build up on the quadradic equation
 function from last week! We want to check a few more things this time and make the function
 perhaps useful in real life!
-}

{- Write a function that takes the coefficients a, b, c of a quadratic equation:
    ax^2 + bx + c = 0.

 It should:
 - Handle cases where a = 0 (i.e., it's not a quadratic equation).
 - Return both real and complex roots when applicable in a message of the type string.
 - Provide feedback about the nature of the roots (distinct, repeated, complex).

 Note 1: You can use the "Let In" and "Where" structures to make the function easier to
 read.
 Note 2: The function abs takes a number as input and returns it's absolute value.
-}
solveQuadratic :: Double -> Double -> Double -> String
solveQuadratic a b c
  | a == 0                  = "Not a quadratic equation"
  | discriminant > 0        = "There are two distinct real roots: " ++ show r1 ++ " and " ++ show r2
  | discriminant == 0       = "There is a single repeated root: " ++ show r1
  | otherwise               = "This quadratic equation only has complex roots: " ++ show realPart ++ " + " ++ show imaginaryPart ++ "i and " ++ show realPart ++ " - " ++ show imaginaryPart ++ "i"
  where
    discriminant = b^2 - 4*a*c
    r1 = (-b + sqrt discriminant) / (2*a)
    r2 = (-b - sqrt discriminant) / (2*a)
    realPart = (-b) / (2*a)
    imaginaryPart = sqrt (abs discriminant) / (2*a)

{-  all guards in a function must be indented at the same level. If they are not, the
 Haskell parser will raise an error because inconsistent indentation breaks the expected
 structure of the code as Haskell is sensitive to indentation. 
 
 However, the number of spaces after the | symbol does not need to be consistent and 
 Haskell will still compile the code correctly. Like with other aspects of formatting,
 it's a good practice to align the conditions for readability but in the end, it's a matter
 of personal preference.

 TL;DR:

 correctSignCheck a
  |             a > 0                           = "Positive"
  | a == 0  = "Zero"
  |                                                          otherwise = "Negative"

 works, while

 incorrectSignCheck a
  | a > 0           = "Positive"
            | a == 0        = "Zero"
                    | otherwise   = "Negative"

  doesn't!
-}
