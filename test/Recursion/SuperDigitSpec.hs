module Recursion.SuperDigitSpec (spec) where

import Recursion.SuperDigit
import Test.Hspec

spec :: Spec
spec = do
  describe "superDigit" $ do
    it "calculates the super digit of the given number n replicated k times" $ do
      superDigit [9875, 1] `shouldBe` 2
      superDigit [148, 3] `shouldBe` 3
