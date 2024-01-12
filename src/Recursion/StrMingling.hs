module Recursion.StrMingling where

main :: IO ()
main = do
  s <- getLine
  t <- getLine
  putStrLn $ mingle s t

mingle :: String -> String -> String
mingle [] _ = []
mingle _ [] = []
mingle (x : xs) (y : ys) = x : y : mingle xs ys
