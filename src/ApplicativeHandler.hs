handler :: Reader Request Response
handler = do
  name <- asks buildNamehandler
  return (fmap Value name)

buildNamehandler :: Request -> MaybeResult String
buildNamehandler r = buildName <$> (required r "first") <*> (opt r "middle") <*> (required r "last")