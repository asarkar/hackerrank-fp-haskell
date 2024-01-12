module Recursion.PascalsTriangleSpec (spec) where

import Data.Foldable as F
import Recursion.PascalsTriangle
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "generates the top n rows of the Pascal's Triangle" $ F.for_ rowsCases rowsTest
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
        assertion = triangle n `shouldBe` expected

    rowsCases =
      [ (0, []),
        (1, [[1]]),
        (2, [[1], [1, 1]]),
        (3, [[1], [1, 1], [1, 2, 1]]),
        (4, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]),
        ( 5,
          [ [1],
            [1, 1],
            [1, 2, 1],
            [1, 3, 3, 1],
            [1, 4, 6, 4, 1]
          ]
        ),
        ( 6,
          [ [1],
            [1, 1],
            [1, 2, 1],
            [1, 3, 3, 1],
            [1, 4, 6, 4, 1],
            [1, 5, 10, 10, 5, 1]
          ]
        ),
        ( 10,
          [ [1],
            [1, 1],
            [1, 2, 1],
            [1, 3, 3, 1],
            [1, 4, 6, 4, 1],
            [1, 5, 10, 10, 5, 1],
            [1, 6, 15, 20, 15, 6, 1],
            [1, 7, 21, 35, 35, 21, 7, 1],
            [1, 8, 28, 56, 70, 56, 28, 8, 1],
            [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]
          ]
        )
      ]
