module Recursion.StrCompressionSpec (spec) where

import qualified Control.Monad as M
import Recursion.StrCompression
import Test.Hspec

spec :: Spec
spec = do
  describe "compress" $ do
    it "creates run-length-encoding of a string" $ do
      let xs = [("abcaaabbb", "abca3b3"), ("abcd", "abcd"), ("aaabaaaaccaaaaba", "a3ba4c2a4ba")]
      M.forM_ xs $ \(s, expected) -> do
        compress s `shouldBe` expected
