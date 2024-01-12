module Recursion.ColorSeqSpec (spec) where

import Data.Foldable as F
import Recursion.ColorSeq
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "determines if the given sequence is full of colors" $ F.for_ rowsCases rowsTest
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
        assertion = isFullOfClr s `shouldBe` expected

    rowsCases = [("RGGR", True), ("RYBG", True), ("RYRB", False), ("YGYGRBRB", False)]
