instance Functor (Either b) where
  fmap f (Left l)  = Left l
  fmap f (Right r) = Right (f r)