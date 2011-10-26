instance Applicative Maybe where
  pure = return
  (<*>) = ap