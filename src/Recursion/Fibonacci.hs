module Recursion.Fibonacci where

main :: IO ()
main = do
  input <- getLine
  print . fib . (read :: String -> Int) $ input

fib :: Int -> Int
fib = go 0 1
  where
    go x _ 1 = x
    go x y n = go y (x + y) (n - 1)
