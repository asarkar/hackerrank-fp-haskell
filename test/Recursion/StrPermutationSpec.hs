module Recursion.StrPermutationSpec (spec) where

import Data.Foldable as F
import Recursion.StrPermutation
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "swaps the characters at the even positions with the next characters" $ F.for_ rowsCases rowsTest
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
        assertion = permute s `shouldBe` expected

    rowsCases =
      [("abcdpqrs", "badcqpsr"), ("az", "za")]
