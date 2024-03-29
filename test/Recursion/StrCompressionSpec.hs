module Recursion.StrCompressionSpec (spec) where

import Data.Foldable as F
import Recursion.StrCompression
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "creates run-length-encoding of the given string" $ F.for_ rowsCases rowsTest
  where
    {-
    it :: (HasCallStack, Example a) => String -> a -> SpecWith (Arg a)

    The it function creates a spec item.
    A spec item consists of:
    - a textual description of a desired behavior
    - an example for that behavior
    -}
    rowsTest (s, expected) = it s assertion
      where
        assertion = compress s `shouldBe` expected

    rowsCases =
      [("abcaaabbb", "abca3b3"), ("abcd", "abcd"), ("aaabaaaaccaaaaba", "a3ba4c2a4ba")]
