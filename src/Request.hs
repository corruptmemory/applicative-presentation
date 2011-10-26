import Data.List (lookup)
import Web.MaybeResult

type Request = [(String,String)]

required :: Request -> String -> MaybeResult String
required r k = maybe (failure $ "Required value for:"++k++" missing") success (lookup k r)

opt :: Request -> String -> MaybeResult (Maybe String)
opt r k = success (lookup k r)