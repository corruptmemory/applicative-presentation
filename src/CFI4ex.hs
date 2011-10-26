fFunc :: (Show a, Show b, Show c) => (b -> c) -> (a -> b) -> (a -> c)
fFunc f x = f <$> x