{-# LANGUAGE PackageImports #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Main (main) where

import Control.Exception (ArithException(..), evaluate)
import Numeric.Natural (Natural)
import "hspec" Test.Hspec
import "hspec" Test.Hspec.QuickCheck
import "QuickCheck" Test.QuickCheck (Negative(..), NonNegative(..))

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "A" $ do
    describe "B" $ do
      prop "identity" $
        \(NonNegative (i :: Integer)) -> i `shouldBe` i
      prop "should throw an Underflow exception on negative inputs" $
        \(Negative (i :: Integer)) ->
          evaluate (fromInteger i :: Natural) `shouldThrow` (== Underflow)
