class Functor f => Pointed f where
  pure :: a -> f a