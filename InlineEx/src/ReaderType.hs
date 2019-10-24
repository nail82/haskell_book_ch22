module ReaderType where

newtype Reader r a =
    Reader {runReader :: (r -> a)}
