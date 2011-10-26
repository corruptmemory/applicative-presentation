{-# LANGUAGE TypeSynonymInstances, Rank2Types, DeriveDataTypeable#-}
module Web.MaybeResult (
          failure,
          success,
          MaybeResult(..)
        ) where

import Control.Applicative
import Data.Functor
import Data.Maybe
import Data.Typeable
import Data.Data

data MaybeResult a = Failure [String]
                   | Success a
  deriving (Eq, Ord, Show, Data, Typeable)

instance Functor MaybeResult where
  fmap _ (Failure s) = Failure s
  fmap f (Success x) = Success (f x)

instance Applicative MaybeResult where
  pure = Success
  Failure e1 <*> Failure e2 = Failure (e1 ++ e2)
  Failure e1 <*> Success _  = Failure e1
  Success _ <*> Failure e2 = Failure e2
  Success f <*> Success a  = Success (f a)


failure :: forall a. String -> MaybeResult a
failure s = Failure [s]

success :: forall a. a -> MaybeResult a
success s = Success s

