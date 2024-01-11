{-# OPTIONS_GHC -Wno-incomplete-uni-patterns #-}

module Recursion.PrefixCompression where

import Control.Arrow ((&&&))

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
