module Lib where

import Control.Applicative

boop :: (Num a) => a -> a
boop = (*2)

doop :: (Num a) => a -> a
doop = (+10)

-- bip and bloop are equivalent
bip :: (Num a) => a -> a
bip = boop . doop

bloop :: (Num a) => a -> a
bloop = fmap boop doop

-- bbop and duwop are equivalent
bbop :: (Num a) => a -> a
bbop = (+) <$> boop <*> doop

duwop :: (Num a) => a -> a
duwop = liftA2 (+) boop doop

boopDoop :: (Num a) => a -> a
boopDoop = do
  a <- boop
  b <- doop
  return (a + b)



someFunc :: IO ()
someFunc = putStrLn "someFunc"
