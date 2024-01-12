module Recursion.FilterElementsSpec (spec) where

import Data.Foldable as F
import Recursion.FilterElements
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "finds integers that are repeated at least k times" $ F.for_ rowsCases rowsTest
  where
    {-
    it :: (HasCallStack, Example a) => String -> a -> SpecWith (Arg a)

    The it function creates a spec item.
    A spec item consists of:
    - a textual description of a desired behavior
    - an example for that behavior
    -}
    rowsTest (xs, k, expected) = it description assertion
      where
        description = show (xs, k)
        assertion = filterEl xs k `shouldBe` expected

    rowsCases =
      [ ([4, 5, 2, 5, 4, 3, 1, 3, 4], 2, [4, 5, 3]),
        ([4, 5, 2, 5, 4, 3, 1, 3, 4], 4, [-1]),
        ([5, 4, 3, 2, 1, 1, 2, 3, 4, 5], 2, [5, 4, 3, 2, 1])
      ]
