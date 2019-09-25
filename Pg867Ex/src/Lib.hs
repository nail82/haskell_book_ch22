module Lib where

import Data.Char
import Control.Applicative

cap :: [Char] -> [Char]
cap xs = fmap toUpper xs

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


--
-- This one took awhile, but the breakthrough
-- happened when I asked
-- :t (,) "joe" :: b -> ([Char], b)
-- and I realized this was the right side of bind.
--
-- How to write this in point free...
tupMB :: [Char] -> ([Char], [Char])
tupMB s = ("", rev s) >>= (,) (cap s)


-- This was other attempts, but it was getting complicated...
-- :t (>>=) ((,) cap) :: (([Char] -> [Char], b1) -> b1 -> b2) -> b1 -> b2
g :: (([Char] -> [Char], b1) -> b1 -> b2) -> b1 -> b2
g = undefined

g' :: ([Char] -> [Char], [Char]) -> [Char] -> ([Char], [Char])
g' = undefined


someFunc :: IO ()
someFunc = putStrLn "someFunc"


-- Back and forth between bind and do notations
mFunc :: Int -> Maybe Int
mFunc x
      | x < 0 = Nothing
      | otherwise = Just (x + 3)


bindIt :: Maybe Int -> Maybe Int
bindIt jx = jx >>= mFunc

doIt :: Maybe Int -> Maybe Int
doIt jx = do
  x <- jx
  mFunc x
