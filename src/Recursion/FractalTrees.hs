module Recursion.FractalTrees (trees) where

import qualified Control.Monad as M

main :: IO ()
main = do
  n <- read <$> getLine :: IO Int
  M.forM_ (trees n) putStrLn

width :: Int
width = 100

height :: Int
height = 63

size :: Int -> Int
-- 16 is given as the initial tree size,
-- which is 2^(5-1).
size n = 2 ^ (5 - n)

trees :: Int -> [String]
trees n = filler ++ concatMap go [n, n - 1 .. 1]
  where
    go i = ctrAdjust branches ++ ctrAdjust trunk
      where
        (branches, trunk) = replicate' i
    -- Number of rows occupied is given by the sum of the
    -- first n terms of the geometric series 16, 8, 4, 2, 1.
    k = (2 :: Int) ^ n
    x = 64 `div` k * (k - 1)
    filler = replicate (height - x) $ padding width

tree :: Int -> ([(Int, String)], [(Int, String)])
tree n = (branches, trunc)
  where
    -- Spacing between the left branch
    -- and the right branch.
    i = 2 * size n - 1
    branches = map (\x -> (x + 2, '1' : padding x ++ "1")) [i, i - 2 .. 1]
    trunc = replicate (size n) (1, "1")

padding :: Int -> String
padding x = replicate x '_'

replicate' :: Int -> ([(Int, String)], [(Int, String)])
replicate' n = go (tree n) n
  where
    -- Spacing between the right branch of the left tree
    -- and the left branch of the right tree.
    i = 2 * size n - 1
    -- Merge a tree with itself. Two trees of size n are merged
    -- to create a tree of size 2n, which is then merged with
    -- itself to make a tree of size 4n, and so on.
    go t 1 = t
    go (branches, trunk) k =
      go
        (merge branches [i, i + 2 ..], merge trunk (repeat (2 * i + 1)))
        (k - 1)
    merge = zipWith (\(a, x) c -> (a + a + c, x ++ padding c ++ x))

ctrAdjust :: [(Int, String)] -> [String]
ctrAdjust xs = do
  (i, row) <- xs
  let w = (width - i) `div` 2
  return $ padding w ++ row ++ padding (w + 1)
