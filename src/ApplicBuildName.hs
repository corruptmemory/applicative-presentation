buildName :: String -> Maybe String -> String -> String
buildName f m l = f ++ " " ++ (maybe "" id m) ++ " " ++ l