module Introduction.FilterArray where

main :: IO ()
main = do
  n <- readLn :: IO Int
  inputdata <- getContents
  let numbers = map read (lines inputdata) :: [Int]
  putStrLn . unlines $ (map show . f n) numbers

f :: Int -> [Int] -> [Int]
f _ [] = []
f n (x : xs)
  | x < n = x : ys
  | otherwise = ys
  where
    ys = f n xs
