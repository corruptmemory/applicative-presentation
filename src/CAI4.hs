instance Applicative ((->) a) where
  pure = const
  (<*>) f g x = f x (g x)