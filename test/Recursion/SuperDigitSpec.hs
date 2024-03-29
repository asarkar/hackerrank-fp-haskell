module Recursion.SuperDigitSpec (spec) where

import Data.Foldable as F
import Recursion.SuperDigit
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "calculates the super digit of the given number" $ F.for_ rowsCases rowsTest
  where
    {-
    it :: (HasCallStack, Example a) => String -> a -> SpecWith (Arg a)

    The it function creates a spec item.
    A spec item consists of:
    - a textual description of a desired behavior
    - an example for that behavior
    -}
    rowsTest (n, k, expected) = it description assertion
      where
        description = concat $ replicate (fromInteger k) (show n)
        assertion = superDigit [n, k] `shouldBe` expected

    rowsCases =
      [ (9875, 1, 2),
        (148, 3, 3)
      ]
