module Recursion.StrReductionSpec (spec) where

import Data.Foldable as F
import Recursion.StrReduction
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "creates a new string by removing all the characters that occurred previously" $ F.for_ rowsCases rowsTest
  where
    {-
    it :: (HasCallStack, Example a) => String -> a -> SpecWith (Arg a)

    The it function creates a spec item.
    A spec item consists of:
    - a textual description of a desired behavior
    - an example for that behavior
    -}
    rowsTest (s, expected) = it description assertion
      where
        description = show s
        assertion = reduce s `shouldBe` expected

    rowsCases =
      [("accabb", "acb"), ("abc", "abc"), ("pprrqq", "prq")]
