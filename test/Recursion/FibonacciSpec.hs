module Recursion.FibonacciSpec (spec) where

import Data.Foldable as F
import Recursion.Fibonacci
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "generates the nth Fibonacci number" $ F.for_ rowsCases rowsTest
  where
    {-
    it :: (HasCallStack, Example a) => String -> a -> SpecWith (Arg a)

    The it function creates a spec item.
    A spec item consists of:
    - a textual description of a desired behavior
    - an example for that behavior
    -}
    rowsTest (n, expected) = it description assertion
      where
        description = show n
        assertion = fib n `shouldBe` expected

    rowsCases = zip [1 .. 8] [0, 1, 1, 2, 3, 5, 8, 13]
