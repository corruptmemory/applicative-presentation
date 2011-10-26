{-# LANGUAGE FlexibleContexts, FlexibleInstances #-}

module Examples.Functor.Simple (
    mFunc,
    eFunc,
    fFunc,
    lFunc
  ) where

import Data.Either
import Control.Monad.Instances
import Data.Functor

mFunc :: (Show a, Show b) => (a -> b) -> Maybe a -> Maybe b
mFunc f x = f <$> x

lFunc :: (Show a, Show b) => (a -> b) -> [a] -> [b]
lFunc f x = f <$> x

eFunc :: (Show a, Show c) => (a -> c) -> (Either [String] a) -> (Either [String] c)
eFunc f x = f <$> x

fFunc :: (Show a, Show b, Show c) => (b -> c) -> (a -> b) -> (a -> c)
fFunc f x = f <$> x