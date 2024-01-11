module Introduction.FilterArraySpec (spec) where

import Introduction.FilterArray
import Test.Hspec
import Test.Hspec.QuickCheck

spec :: Spec
spec = do
  describe "FilterArray" $ do
    prop "filters out numbers greater than a given number" $
      \(n, xs) -> f n xs `shouldBe` filter (< n) xs
