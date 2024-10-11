

import Data.List

deSort1 = reverse . sort
deSort2 = \x -> reverse (sort x)

main = do 
    print $ deSort1 [4, 5, 1, 2]
    print $ deSort2 [40, 50, 10, 20]