import Data.Char (ord, chr)


offset :: Int
offset = ord 'A' - ord 'a'
toUpper :: Char -> Char
toUpper ch = chr (ord ch + offset)

