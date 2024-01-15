module FunctionalStructures.GCDSpec (spec) where

import Data.Foldable as F
import FunctionalStructures.GCD
import Test.Hspec

spec :: Spec
-- for_ :: (Foldable t, Applicative f) => t a -> (a -> f b) -> f ()
spec = describe "calculates GCD of a list of positive integers" $ F.for_ rowsCases rowsTest
  where
    {-
    it :: (HasCallStack, Example a) => String -> a -> SpecWith (Arg a)

    The it function creates a spec item.
    A spec item consists of:
    - a textual description of a desired behavior
    - an example for that behavior
    -}
    rowsTest (xs, expected) = it description assertion
      where
        description = show xs
        assertion = gcd' xs `shouldBe` expected

    rowsCases =
      [ ( [ [(7, 2)],
            [(2, 2), (7, 1)]
          ],
          [(7, 1)]
        ),
        ( [ [(2, 2), (3, 2), (5, 3)],
            [(3, 2), (5, 3), (11, 1)],
            [(2, 2), (3, 3), (5, 4), (7, 6), (19, 18)],
            [(3, 10), (5, 15)]
          ],
          [(3, 2), (5, 3)]
        )
      ]
