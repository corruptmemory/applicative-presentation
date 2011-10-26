lFunc :: (Show a, Show b) => (a -> b) -> [a] -> [b]
lFunc f x = f <$> x