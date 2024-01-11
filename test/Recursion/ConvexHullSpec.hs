module Recursion.ConvexHullSpec (spec) where

import Recursion.ConvexHull
import Test.Hspec

trunc :: Double -> Int -> Double
trunc x n = fromIntegral z / y
  where
    y = 10 ^ n
    z = floor (x * y) :: Int

spec :: Spec
spec = do
  describe "solve" $ do
    it "calculates the perimeter of the convex hull for the given points" $ do
      let points = [(1, 1), (3, 2), (5, 3), (2, 2), (3, 3), (2, 5)]
      let actual = trunc (solve points) 3
      actual `shouldBe` 12.200
