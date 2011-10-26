eFunc :: (Show a, Show c) => (a -> c) -> (Either [String] a) -> (Either [String] c)
eFunc f x = f <$> x