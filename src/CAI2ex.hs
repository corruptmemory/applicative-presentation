lAplic :: (Show a, Show b) => (a -> b) -> [a] -> [b]
lAplic f x = pure f <*> x