handler :: Reader Request Response
handler = do
  first <- myRequired "first"
  middle <- myOptional "middle"
  last <- myRequired "last"
  return (fmap Value (buildName <$> first <*> middle <*> last))

browser :: Request -> String
browser r = case (runReader handler r) of
              Success (Value v) -> "Page rendered STRING: "++v
              Success (Stream vs) -> "Page rendered STREAM: "++(show vs)
              Failure v -> "BZZT! Invalid request: "++(show v)