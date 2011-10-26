eAplic :: (Show a, Show c) => (a -> c) -> (Either [String] a) -> (Either [String] c)
eAplic f x = pure f <*> x