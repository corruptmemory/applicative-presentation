module Main (main) where

import Examples.Functor.Simple
import Examples.Applicative.Simple
import Data.Either
import Web.Request
import Web.RequestReader
import Web.Response
import Control.Monad.Reader
import Control.Applicative
import Data.Functor
import Web.MaybeResult
import Data.Traversable

goodRequest :: Request
goodRequest = [("first","James"),("last","Powers")]

badRequest :: Request
badRequest = [("first","James")]

badRequest1 :: Request
badRequest1 = [("middle","Matthew")]

handler1 :: Reader Request Response
handler1 = do
  first <- myRequired "first"
  middle <- myOptional "middle"
  last <- myRequired "last"
  return (fmap Value (buildName <$> first <*> middle <*> last))

handler :: Reader Request Response
handler = do
  name <- asks buildNamehandler
  return (fmap Value name)

buildNamehandler :: Request -> MaybeResult String
buildNamehandler r = buildName <$> (required r "first") <*> (opt r "middle") <*> (required r "last")

browser :: Request -> String
browser r = case (runReader handler r) of
              Success (Value v) -> "Page rendered STRING: "++v
              Success (Stream vs) -> "Page rendered STREAM: "++(show vs)
              Failure v -> "BZZT! Invalid request: "++(show v)

accumulateGood :: [Maybe String] -> Maybe [String]
accumulateGood i = traverse id i

main :: IO ()
main = do
  putStrLn $ show $ mFunc length (Just "Hello")
  putStrLn $ show $ mAplic length (Just "Hello")
  putStrLn $ show $ lFunc length (["I'm","sorry","Dave,","I","can't","let","you","do","that."])
  putStrLn $ show $ lAplic length (["I'm","sorry","Dave,","I","can't","let","you","do","that."])
  putStrLn $ show (eFunc length (Right "Hello"))
  putStrLn $ show (eFunc length (Left ["Fail"] :: Either [String] String))
  putStrLn $ show (eAplic length (Right "Hello"))
  putStrLn $ show (eAplic length (Left ["Fail"] :: Either [String] String))
  putStrLn $ show $ (fFunc length (\l -> replicate l "a")) 5
  putStrLn $ show $ (fAplic length (\l -> replicate l "a")) 5
  putStrLn $ buildName "James" (Just "Matthew") "Powers"
  putStrLn $ buildName "James" Nothing "Powers"
  putStrLn $ show $ nice (Just "James") (Just "Matthew") (Just "Powers")
  putStrLn $ show $ nice (Just "James") (Just "Matthew") Nothing
  putStrLn $ show $ sweet (Just "James") (Just "Matthew") (Just "Powers")
  putStrLn $ show $ sweet (Just "James") (Just "Matthew") Nothing
  putStrLn $ show $ browser goodRequest
  putStrLn $ show $ browser badRequest
  putStrLn $ show $ browser badRequest1
  putStrLn $ show $ accumulateGood [Just "1", Just "2"]
  putStrLn $ show $ accumulateGood [Just "1", Nothing, Just "2" ]