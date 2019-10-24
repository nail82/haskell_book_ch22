{-# LANGUAGE InstanceSigs#-}

module ReaderApplicative where

import ReaderType

-- Tried doing this without looking at the book (pg 872)
-- but was unsuccessful.
instance Functor (Reader r) where
    fmap :: (a -> b) -> (Reader r a) -> (Reader r b)
    fmap f (Reader ra) = Reader (f . ra)

-- Had to cheat on this one as well
instance Applicative (Reader r) where
    -- Puts an `a' inside a Reader that alway returns an `a'
    -- const wasn't even in my thought process
    pure a = Reader $ const a

    (<*>) (Reader fb) (Reader ra) =  undefined


-- Reader oneType :: Reader String Int
oneType :: String -> Int
oneType = length

-- Reader twoTypes :: Reader Char (String -> Int)
twoTypes :: Char -> String -> Int
twoTypes c cs = length $ c : cs

-- Reader threeTypes :: Reader Int (Char -> String -> Int)
threeTypes :: Int -> Char -> String -> Int
threeTypes x c cs = x + (length $ c : cs)
