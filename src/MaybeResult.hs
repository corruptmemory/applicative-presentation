data MaybeResult a = Failure [String]
                   | Success a
  deriving (Eq, Ord, Show, Data, Typeable)

failure :: forall a. String -> MaybeResult a
failure s = Failure [s]

success :: forall a. a -> MaybeResult a
success s = Success s