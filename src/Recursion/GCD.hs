{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

module Recursion.GCD where

main :: IO ()
main = do
  input <- getLine
  print . uncurry gcd' . listToTuple . convertToInt . words $ input
  where
    listToTuple (x : xs : _) = (x, xs)
    convertToInt = map (read :: String -> Int)

gcd' :: (Integral a) => a -> a -> a
gcd' n m
  | m == 0 = n
  | n < m = gcd' m n
  | otherwise = gcd' m (n `mod` m)
