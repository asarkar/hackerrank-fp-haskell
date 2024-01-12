module Recursion.GCDSpec (spec) where

import Data.Foldable as F
import Recursion.GCD
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "calculates the GCD of two positive integers" $ F.for_ rowsCases rowsTest
  where
    {-
    it :: (HasCallStack, Example a) => String -> a -> SpecWith (Arg a)

    The it function creates a spec item.
    A spec item consists of:
    - a textual description of a desired behavior
    - an example for that behavior
    -}
    rowsTest (n, m, expected) = it description assertion
      where
        description = show (n, m)
        assertion = gcd' n m `shouldBe` expected

    rowsCases =
      [(36, 63, 9 :: Int), (125, 81, 1), (221, 559, 13)]
