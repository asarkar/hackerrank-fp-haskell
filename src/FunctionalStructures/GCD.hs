{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

module FunctionalStructures.GCD (gcd') where

import qualified Control.Monad as M

main :: IO ()
main = do
  n <- readLn :: IO Int
  xs <- M.replicateM n $ chunks . map (read :: String -> Int) . words <$> getLine
  putStrLn . unwords $ concatMap (\(x, y) -> [show x, show y]) (gcd' xs)

chunks :: [Int] -> [(Int, Int)]
chunks [] = []
chunks (x : y : xs) = (x, y) : chunks xs

{-
The problem represents a number as the sum of powers of its prime factors.
For example:
  12 = 2^2 x 3^1, represented as a list of tuples [(2, 2), (3, 1)].

We consider the numbers pairwise, and compute their GCD as minimum power
of common factors.
For example:
  gcd(12, 9)
  = gcd([(2, 2), (3, 1)], [(3, 2)])
  = [(3, 1)]
-}
gcd' :: [[(Int, Int)]] -> [(Int, Int)]
gcd' = foldl1 factors

factors :: [(Int, Int)] -> [(Int, Int)] -> [(Int, Int)]
factors _ [] = []
factors [] _ = []
factors a@((x, i) : xs) b@((y, j) : ys)
  | x == y = (x, min i j) : factors xs ys
  | x < y = factors xs b
  | otherwise = factors a ys
