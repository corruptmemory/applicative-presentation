nice :: Maybe String -> Maybe String -> Maybe String -> Maybe String
nice f m l = do
  fn <- f
  ln <- l
  return $ buildName fn m ln