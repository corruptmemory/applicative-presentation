module Web.Response (
  Response,
  ResponseValue(..)
) where

import Web.MaybeResult

data ResponseValue = Value String
                   | Stream [String]
                     deriving (Show)

type Response = MaybeResult ResponseValue
