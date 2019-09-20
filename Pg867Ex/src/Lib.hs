module Lib where

import Data.Char
import Control.Applicative

cap :: [Char] -> [Char]
cap xs = map toUpper xs

rev :: [Char] -> [Char]
rev xs = reverse xs

composed :: [Char] -> [Char]
composed = cap . rev

fmapped :: [Char] -> [Char]
fmapped = fmap cap rev


-- tupled "joe" == ("JOE", "eoj")
-- tupled' "joe" == ("eoj", "JOE")

tupled :: [Char] -> ([Char], [Char])
tupled = (,) <$> cap <*> rev
-- or
-- tupled = liftA2 (,) cap rev

tupled' :: [Char] -> ([Char], [Char])
tupled' = (,) <$> rev <*> cap

tupMdo :: [Char] -> ([Char], [Char])
tupMdo = do
  a <- cap
  b <- rev
  return ((,) a b)

-- :t (>>=) :: m a -> (a -> m b) ->   m  b
--                               -> (a,) b
tupMJ :: [Char] -> ([Char], [Char])
tupMJ = undefined

someFunc :: IO ()
someFunc = putStrLn "someFunc"
