-- 22
module Lib where

import Control.Applicative

someFunc :: IO ()
someFunc = putStrLn "someFunc"


-- Pg 874 Dog stuff, just to get my hands dirty
newtype HumanName =
    HumanName String
    deriving (Eq, Show)

newtype DogName =
    DogName String
    deriving (Eq, Show)

newtype Address =
    Address String
    deriving (Eq, Show)

data Person =
    Person {
      humanName :: HumanName
    , dogName :: DogName
    , address :: Address
    } deriving (Eq, Show)

data Dog =
    Dog {
      dogsName :: DogName
    , dogsAddress :: Address
    } deriving (Eq, Show)

bub = Person
      (HumanName "bub")
      (DogName "rico")
      (Address "Huntsville")

rico = Dog
       (DogName "rico")
       (Address "Huntsville")

-- Dog fields are a subset of Person fields
getDogR :: Person -> Dog
getDogR = Dog <$> dogName <*> address


-- Pg 877
myLiftA2 :: Applicative f =>
            (a -> b -> c)
            -> f a -> f b -> f c
myLiftA2 d fa fb = d <$> fa <*> fb

asks :: (r -> a) -> Reader r a
asks f = undefined
