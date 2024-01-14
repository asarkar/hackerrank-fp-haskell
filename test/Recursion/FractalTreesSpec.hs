module Recursion.FractalTreesSpec (spec) where

import Data.Foldable as F
import Recursion.FractalTrees
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "generates the fractal trees after n iterations" $ F.for_ rowsCases rowsTest
  where
    {-
    it :: (HasCallStack, Example a) => String -> a -> SpecWith (Arg a)

    The it function creates a spec item.
    A spec item consists of:
    - a textual description of a desired behavior
    - an example for that behavior
    -}
    rowsTest n = it description assertion
      where
        description = show n
        toPath s = "test/Recursion/FractalTrees/" ++ show s ++ ".txt"
        expected = lines <$> readFile (toPath n)
        actual = trees n
        assertion = expected >>= (actual `shouldBe`)

    rowsCases = [1, 2, 5]
