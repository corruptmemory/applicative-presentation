mAplic :: (a -> b) -> Maybe a -> Maybe b
mAplic f x = pure f <*> x