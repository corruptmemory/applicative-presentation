data ResponseValue = Value String
                   | Stream [String]
                     deriving (Show)

type Response = MaybeResult ResponseValue