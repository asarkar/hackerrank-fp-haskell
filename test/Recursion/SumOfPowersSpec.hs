module Recursion.SumOfPowersSpec (spec) where

import Data.Foldable as F
import Recursion.SumOfPowers
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "counts the number of ways x = ∑k^n, where x and n are given, and k >= 1" $ F.for_ rowsCases rowsTest
  where
    {-
    it :: (HasCallStack, Example a) => String -> a -> SpecWith (Arg a)

    The it function creates a spec item.
    A spec item consists of:
    - a textual description of a desired behavior
    - an example for that behavior
    -}
    rowsTest (x, n, expected) = it description assertion
      where
        description = show (x, n)
        assertion = sumOfPowers x n `shouldBe` expected

    rowsCases =
      [(100, 2, 3), (100, 3, 1)]
