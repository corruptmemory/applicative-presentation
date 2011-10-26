goodRequest = [("first","James"),("last","Powers")]

badRequest = [("first","James")]

badRequest1 = [("middle","Matthew")]

main = do
  putStrLn $ show $ browser goodRequest
  putStrLn $ show $ browser badRequest
  putStrLn $ show $ browser badRequest1