module Recursion.StrPermutation where

import qualified Control.Monad as M

main :: IO ()
main = do
  n <- read <$> getLine :: IO Int
  M.forM_ [1 .. n] $ \_ -> do
    s <- getLine
    putStrLn $ permute s

permute :: String -> String
permute (x : y : xs) = y : x : permute xs
permute xs = xs
