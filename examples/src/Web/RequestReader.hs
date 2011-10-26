module Web.RequestReader where

import Control.Monad.Reader
import Web.Request
import Web.MaybeResult

myRequired :: String -> Reader Request (MaybeResult String)
myRequired k =
  asks (doRead k) >>= return
  where
    doRead k r = required r k

myOptional :: String -> Reader Request (MaybeResult (Maybe String))
myOptional k =
  asks (doRead k) >>= return
  where
    doRead k r = opt r k
