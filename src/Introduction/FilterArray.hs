module Introduction.FilterArray where

f :: Int -> [Int] -> [Int]
f _ [] = []
f n (x : xs)
  | x < n = x : ys
  | otherwise = ys
  where
    ys = f n xs
