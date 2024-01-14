module Recursion.SierpinskiTriangle (triangle) where

import qualified Control.Monad as M

main :: IO ()
main = do
  n <- read <$> getLine :: IO Int
  M.forM_ (triangle n) putStrLn

width :: Int
width = 63

height :: Int
height = 32

{-
We create the initial topmost triangle, then flip it, fill it with '_',
and sandwich it between two copies of the unmodified triangle (before flipping)
to make the lower half. We then combine the top and the bottom halves
to create a bigger triangle.
We continue this process until we have filled the complete height of the canvas.

The length of each row is used to calculate the amount of padding required.
Since calculating the length of a string is an O(n) operation, we also
carry the length of a row with each row.
-}
triangle :: Int -> [String]
triangle n = ctrAdjust $ replicate' $ zip [1 :: Int, 3 ..] initial
  where
    -- k is the number of rows in the topmost triangle.
    k = (width + 1) `div` ((2 :: Int) ^ (n + 1))
    initial = take k $ iterate (('1' :) . (++ "1")) "1"

replicate' :: [(Int, String)] -> [(Int, String)]
replicate' xs
  | length xs == height = xs
  | otherwise = replicate' $ xs ++ merge xs (reverse xs)
  where
    merge = zipWith (\(i, x) (j, _) -> (i + j + i, x ++ padding j ++ x))

padding :: Int -> String
padding x = replicate x '_'

-- Pads each row on the left and right with '_'
-- to make it equal to width in length.
ctrAdjust :: [(Int, String)] -> [String]
ctrAdjust xs = do
  (i, row) <- xs
  let w = (width - i) `div` 2
  return $ padding w ++ row ++ padding w
