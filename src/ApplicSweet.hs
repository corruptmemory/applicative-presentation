sweet :: Maybe String -> Maybe String -> Maybe String -> Maybe String
sweet f m l = buildName <$> f <*> (pure m) <*> l