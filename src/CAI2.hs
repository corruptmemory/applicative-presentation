instance Applicative [] where
  pure a = [a]
  [] <*> _ = []
  _ <*> [] = []
  f:fs <*> l = (map f l) ++ (fs <*> l)