{-# OPTIONS_GHC -Wno-incomplete-uni-patterns #-}

module Recursion.PrefixCompression where

import Control.Arrow ((&&&))
import qualified Control.Monad as M

main :: IO ()
main = do
  s <- getLine
  t <- getLine
  M.forM_ (compress s t) $ \(i, xs) -> do
    putStrLn $ show i ++ " " ++ xs

compress :: String -> String -> [(Int, String)]
compress = (map (length &&& id) .) . go []
  where
    go common [] ys = [common, "", ys]
    go common xs [] = [common, xs, ""]
    go common (x : xs) (y : ys)
      | x == y = [x : common', xs', ys']
      | otherwise = [common, x : xs, y : ys]
      where
        [common', xs', ys'] = go common xs ys
