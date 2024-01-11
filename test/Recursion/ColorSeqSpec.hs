module Recursion.ColorSeqSpec (spec) where

import qualified Control.Monad as M
import Recursion.ColorSeq
import Test.Hspec

spec :: Spec
spec = do
  describe "isFullOfClr" $ do
    it "determines if the given sequence is full of colors as per the the rules" $ do
      let xs = [("RGGR", True), ("RYBG", True), ("RYRB", False), ("YGYGRBRB", False)]
      M.forM_ xs $ \(s, expected) -> do
        isFullOfClr s `shouldBe` expected
