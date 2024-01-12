module Recursion.FilterElements where

import qualified Control.Monad as M
import qualified Data.IntMap.Strict as IM

main :: IO ()
main = do
  n <- read <$> getLine :: IO Int
  M.forM_ [1 .. n] $ \_ -> do
    xs <- uncurry filterEl <$> parse
    (putStrLn . unwords . map show) xs

parse :: IO ([Int], Int)
parse = do
  k <- read . last . words <$> getLine
  xs <- map read . words <$> getLine
  return (xs, k)

filterEl :: [Int] -> Int -> [Int]
filterEl xs k = case map fst $ filter g ys of
  [] -> [-1]
  zs -> zs
  where
    g (x, i) = count >= k && i == j
      where
        (j, count) = indices IM.! x
    ys = zip xs [0 :: Int ..]
    indices = foldr (\(x, i) m -> IM.insertWith f x (i, 1) m) IM.empty ys
    -- f new_value old_value
    f (x, _) (_, count) = (x, count + 1)
