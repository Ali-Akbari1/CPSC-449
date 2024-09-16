zeroDivision :: Double -> Double -> Either String Double

zeroDivision _ 0 = Left "not possible"
zeroDivision x y = Right (x / y)

answer1 = zeroDivision 10 0
answer2 = zeroDivision 4 2

main :: IO ()
main = do
    print answer1
    print answer2