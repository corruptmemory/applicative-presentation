desired :: Maybe String -> Maybe String -> Maybe String -> Maybe String
desired f m l = buildName <$> f <$> (Just m) <$> l