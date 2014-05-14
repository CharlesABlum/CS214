module ConvertLine
( int2intlist
, str2intlist
) where

import Data.Char (digitToInt)

int2intlist :: Int -> [Int]
int2intlist s = map digitToInt (show s)

str2intlist :: [Char] -> [Int]
str2intlist s = map digitToInt s

