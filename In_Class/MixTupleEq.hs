type MixTuple = (Int, Char)

s1 :: MixTuple 
s1 = (9,'c')
s2 :: MixTuple 
s2 = (9,'a')
ans :: Bool 
ans = s1 == s2 

main :: IO ()
main = print ans 
