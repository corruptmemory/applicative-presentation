mFunc :: (Show a, Show b) => (a -> b) -> Maybe a -> Maybe b
mFunc f x = f <$> x