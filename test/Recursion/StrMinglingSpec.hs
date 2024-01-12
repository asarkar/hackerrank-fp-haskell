module Recursion.StrMinglingSpec (spec) where

import Data.Foldable as F
import Recursion.StrMingling
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "creates a new string by alternating characters from two given strings" $ F.for_ rowsCases rowsTest
  where
    {-
    it :: (HasCallStack, Example a) => String -> a -> SpecWith (Arg a)

    The it function creates a spec item.
    A spec item consists of:
    - a textual description of a desired behavior
    - an example for that behavior
    -}
    rowsTest (s, t, expected) = it description assertion
      where
        description = show (s, t)
        assertion = mingle s t `shouldBe` expected

    rowsCases =
      [("abcde", "pqrst", "apbqcrdset"), ("hacker", "ranker", "hraacnkkeerr")]
