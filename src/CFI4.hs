instance Functor ((->) t) where
  fmap f g = f . g