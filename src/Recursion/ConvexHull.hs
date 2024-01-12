{-# LANGUAGE DerivingStrategies #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-incomplete-uni-patterns #-}

module Recursion.ConvexHull (solve) where

import qualified Data.Function as F
import qualified Data.List as L
import qualified Data.Ord as O
import qualified Data.Tuple as T
import qualified Text.Printf as P

main :: IO ()
main = do
  _ <- readLn :: IO Int
  content <- getContents
  let points = (map (((\[x, y] -> (x, y)) . map (read :: String -> Int)) . words) . lines) content
      ans = solve points

  P.printf "%.1f\n" ans

type Point = (Int, Int)

data Turn = CW | CCW | Collinear deriving stock (Eq, Show)

{-
The Convex Hull of a set of N points is the smallest perimeter fence
that encloses all of the points.
Alternatively, it is the smallest area convex polygon enlosing all of
the points.

Implementation of the "Graham scan" algorithm:
1. Find the point p with the smallest y-coordinate.
2. Sort all the points by polar angle from p.
3. Iterate over the points in sorted order, discarding when a clockwise
   turn is created.
   3.1 Make sure that the sort places collinear points in expected sequence.

Video tutorial at: https://youtu.be/B2AJoQSZf4M
-}
solve :: [Point] -> Double
solve points = perimeter z (z : zs)
  where
    -- Find the point with the minimum y-coordinate.
    start = L.minimumBy (compare `F.on` T.swap) points
    -- Sort by angle with respect to the starting point.
    (x : y : ys) = L.sortBy (ordByAngle start) points
    (z : zs) = hull start ys [y, x]

{-
Sorts the points such that if for two points a and b, b is to the
right of a (clockwise turn), it appears later in the list.
For collinear points, we simply compare the coordinates.
-}
ordByAngle :: Point -> Point -> Point -> Ordering
ordByAngle ref a b
  | a == ref = LT
  | b == ref = GT
  | t == Collinear = O.compare a b
  | t == CW = GT
  | otherwise = LT
  where
    t = turn ref a b

{-
Given 3 points a, b and c, determines if the point b is to the right
or left of the point c with respect to the point a. In other words,
from c to b, is a clockwise or anticlockwise turn.

We make use of the cross-product of two vectors, in this case ab and ac.
The cross product calculates the signed area of the parallelogram enclosed
between the vectors. If the area is positive, then c is to the right of b
(counter-clockwise turn), otherwise, c is to the left (clockwise turn).
-}
turn :: Point -> Point -> Point -> Turn
turn (ax, ay) (bx, by) (cx, cy)
  | area < 0 = CW
  | area > 0 = CCW
  | otherwise = Collinear
  where
    area = (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)

{-
Given the starting point, the remaining points, and the stack with the
initial two points, in that order, calculates the Convex Hull.
If the point on the top of the stack makes a clockwise turn with respect
to the next point, then the point on the stack is popped and discarded.
-}
hull :: Point -> [Point] -> [Point] -> [Point]
-- Check if the very last point pushed is collinear.
hull start [] (y : z : ys) = if turn z y start == CCW then y : z : ys else z : ys
hull start (x : xs) (y : ys)
  | (not . null) ys && turn (head ys) y x /= CCW = hull start (x : xs) ys
  | otherwise = hull start xs (x : y : ys)

-- Calculates the Pythagorean distance between two points.
dist :: Point -> Point -> Double
dist (ax, ay) (bx, by) = sqrt (x + y)
  where
    x = fromIntegral ((bx - ax) ^ (2 :: Int)) :: Double
    y = fromIntegral ((by - ay) ^ (2 :: Int)) :: Double

-- Calculates the perimeter of the Convex Hull. We simply
-- add up the distances between adjacent points.
perimeter :: Point -> [Point] -> Double
perimeter start [x, y] = dist start y + dist x y
perimeter start (x : y : ys) = dist x y + perimeter start (y : ys)
