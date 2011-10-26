instance Applicative [] where
  pure = return
  (<*>) = ap