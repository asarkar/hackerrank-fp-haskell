module Recursion.SumOfPowers where

main :: IO ()
main = do
  x <- read <$> getLine :: IO Int
  n <- read <$> getLine :: IO Int
  print $ sumOfPowers x n

{-
For k = (n-th root of x) to 1, if k^n <= x, we recurse of (x - k^n).
If it becomes 0, then we have found 1 combination.
-}
sumOfPowers :: Int -> Int -> Int
sumOfPowers 0 _ = 0
sumOfPowers x n = sums x maxk
  where
    maxk = round $ fromIntegral x ** recip (fromIntegral n :: Float)
    sums 0 _ = 1
    sums y k = sum [sums (y - p) (i - 1) | i <- [k, k - 1 .. 1], let p = i ^ n, p <= y]
