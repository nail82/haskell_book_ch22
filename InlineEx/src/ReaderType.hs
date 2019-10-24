module ReaderType where

-- r is the left-most type of the function that Reader holds
-- a is the type that results when we apply a type r to the function
-- inside of reader.
newtype Reader r a =
    Reader {runReader :: (r -> a)}
