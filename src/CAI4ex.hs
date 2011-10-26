fAplic :: (Show a, Show b, Show c) => (b -> c) -> (a -> b) -> (a -> c)
fAplic f x = pure f <*> x