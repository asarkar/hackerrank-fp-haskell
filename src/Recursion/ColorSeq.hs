module Recursion.ColorSeq (isFullOfClr) where

isFullOfClr :: String -> Bool
isFullOfClr s =
  count 'R' == count 'G'
    && count 'Y' == count 'B'
    && count' 0 0 'R' 'G' s
    && count' 0 0 'Y' 'B' s
  where
    count c = (length . filter (c ==)) s

count' :: Int -> Int -> Char -> Char -> String -> Bool
count' i j _ _ [] = abs (i - j) <= 1
count' i j c1 c2 (x : xs) = abs (i - j) <= 1 && count' i' j' c1 c2 xs
  where
    i' = i + fromEnum (x == c1)
    j' = j + fromEnum (x == c2)
