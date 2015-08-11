{-# LANGUAGE OverloadedStrings #-}
module App (run) where

import Web.Scotty
import Data.Monoid (mconcat)
import qualified Data.Text.Lazy as T

run :: IO ()
run = scotty 3000 $ do
    get "/scotty/:word" $ do
        beam <- param "word"
        html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]
    get "/test" $ do
        name <- param "name"
        age <- param "age"
        html $ mconcat ["<p>Hi ", name, "!", T.pack $ ageJab age]
                       where ageJab age = ageInsult (age::Int)


ageInsult :: Int -> String
ageInsult age
          | age < 10 = "My GOD child!"
          | age >= 10 && age <= 28 = "What up son?!"
          | otherwise = "With age comes wisdom, I hope.."
