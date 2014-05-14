--This Module handles the IO functions for the 
-- sudoku solver:
-- Name:  Charles Blum
-- For: Final Project - cs 214
-- Project: Simple Sudoku Solver
-- Date Completed: 13 May 2014
--
--
-- Reading file IO properly:
-- http://stackoverflow.com/questions/9748474/reading-from-input-files-in-haskell
module SudokuIO
( parseFile
, printBoard
, printFancyBoard
) where

import Data.Array
import Data.Char
import Control.Monad
--import System.Environment

---------------------------------------------
---------------------------------------------
-- Borrowed code from the above link...
readWords :: (Read a) => String -> [a]
readWords = map read . words

parseFile :: String -> Int -> Int -> IO (Array (Int, Int) Int)
parseFile fname rows cols = do
    matr <- liftM readWords $ readFile fname
    return $ listArray ((1, 1), (cols, rows)) matr
    -- (matr :: [Int] is inferred from the parseFile's type)
-- end of borrowed code
---------------------------------------------
---------------------------------------------

---------------------------------------------
-- This prints out the board like it is in
-- the text file.  It is not exactly pretty
---------------------------------------------
printBoard :: Array(Int, Int) Int -> IO ()
printBoard a = do 
  mapM_ (\row -> printLine row) [1..9]
  where printLine row = putStrLn (map (\col -> intToDigit $ a!(row,col)) [1..9]) 

---------------------------------------------
-- This prints a much more readable board.
-- Mainly it separates everything into 
-- 3x3 boxes instead of a 9x9 grid.
---------------------------------------------
printFancyBoard :: Array(Int, Int) Int -> IO ()
printFancyBoard a = do
  putStrLn "+---+---+---+"
  mapM_ (\row -> printFancyLine row) [1..3]  
  putStrLn "+---+---+---+"
  mapM_ (\row -> printFancyLine row) [4..6]  
  putStrLn "+---+---+---+"
  mapM_ (\row -> printFancyLine row) [7..9]  
  putStrLn "+---+---+---+"
  where printFancyLine row = putStr ("|" ++ set row 1 ++ "|" ++ set row 4 ++ "|" ++ set row 7 ++ "|\n")
        set row x = map (\col -> intToDigit $ a!(row,col)) [x..(x+2)]
