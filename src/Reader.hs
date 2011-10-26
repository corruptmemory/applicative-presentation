newtype Reader r a = Reader {
  runReader :: r -> a
}

instance Monad (Reader r) where
  return a = Reader $ \_ -> a
  m >>= k  = Reader $ \r -> runReader (k (runReader m r)) r