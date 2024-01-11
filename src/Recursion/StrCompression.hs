module Recursion.StrCompression where

import qualified Data.List as L

compress :: String -> String
compress = concatMap go . L.group
  where
    go [x] = [x]
    go xs = head xs : show n
      where
        n = length xs
