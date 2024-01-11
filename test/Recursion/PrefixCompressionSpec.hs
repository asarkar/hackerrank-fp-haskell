module Recursion.PrefixCompressionSpec (spec) where

import Recursion.PrefixCompression
import Test.Hspec

spec :: Spec
spec = do
  describe "compress" $ do
    it "extracts the longest common prefix between the given strings" $ do
      compress "abcdefpr" "abcpqr"
        `shouldBe` [(3, "abc"), (5, "defpr"), (3, "pqr")]
