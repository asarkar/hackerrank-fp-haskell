module Recursion.StrReduction where

import qualified Data.Set as Set

main :: IO ()
main = getLine >>= putStrLn . reduce

reduce :: String -> String
reduce = reverse . fst . foldl go ([], Set.empty)
  where
    go (acc, seen) c
      | Set.member c seen = (acc, seen)
      | otherwise = (c : acc, Set.insert c seen)
