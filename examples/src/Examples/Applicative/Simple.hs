{-# LANGUAGE FlexibleContexts, FlexibleInstances #-}

module Examples.Applicative.Simple (
    mAplic,
    lAplic,
    eAplic,
    fAplic,
    buildName,
    nice,
    sweet
  ) where

import Data.Either
import Control.Applicative
import Control.Monad.Instances
import Data.Functor

mAplic :: (a -> b) -> Maybe a -> Maybe b
mAplic f x = pure f <*> x

lAplic :: (Show a, Show b) => (a -> b) -> [a] -> [b]
lAplic f x = pure f <*> x

eAplic :: (Show a, Show c) => (a -> c) -> (Either [String] a) -> (Either [String] c)
eAplic f x = pure f <*> x

fAplic :: (Show a, Show b, Show c) => (b -> c) -> (a -> b) -> (a -> c)
fAplic f x = pure f <*> x

buildName :: String -> Maybe String -> String -> String
buildName f m l = f ++ " " ++ (maybe "" (\x -> x++" ") m) ++ l

nice :: Maybe String -> Maybe String -> Maybe String -> Maybe String
nice f m l = do
  fn <- f
  ln <- l
  return $ buildName fn m ln

sweet :: Maybe String -> Maybe String -> Maybe String -> Maybe String
sweet f m l = buildName <$> f <*> (pure m) <*> l
