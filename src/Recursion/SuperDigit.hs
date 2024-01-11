module Recursion.SuperDigit where

{-
main = interact (show . superDigit . map read . words)
-}

superDigit :: [Integer] -> Integer
superDigit = (\x -> if x == 0 then 9 else x) . (`rem` 9) . product . map (`rem` 9)
