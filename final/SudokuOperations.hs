--This Module handles the solving of a sudoku puzzle:
-- Name:  Charles Blum
-- For: Final Project - cs 214
-- Project: Simple Sudoku Solver
-- Date Completed: 13 May 2014
--
--
-- Other Sudoku Solvers; got inspiration from #2.
-- http://www.haskell.org/haskellwiki/Sudoku#Simple_solver
module SudokuOperations
( readAndSolve
, solveBoard
) where

import Data.Char 
import Data.List
import Data.Array
import qualified Data.Set as Set
import SudokuIO  --My module

--------------------------------------------
-- readIn takes a file and number of rows
-- and columns and reads in a minial sudoku
-- and then shows the output.
--------------------------------------------
readAndSolve :: String -> Int -> Int -> IO()
readAndSolve file cols rows = do 
  myBoard <- parseFile file cols rows
  putStrLn "Starting Board:"
  printFancyBoard  myBoard
  putStrLn "Solving...."
  let myFinishedBoard = solveBoard myBoard (1, 1)
  printFancyBoard myFinishedBoard
  putStrLn"\nPuzzle Solved!"

--------------------------------------------
-- The following function takes in a list of 
-- values which are used in relation an 
-- implied index (see where the function is
-- called for use), and returns the 
-- complement list.
--------------------------------------------
getCompNums :: [Int] -> Set.Set Int
getCompNums usedNumbers = 
  let used = Set.fromList usedNumbers 
  in  Set.difference (Set.fromList [1..9]) used

-------------------------------------------
-- These 3 functions return either a row,
-- column, or 3x3 box, depending on which 
-- function was used.
-------------------------------------------
getRow :: Array(Int, Int) Int -> Int -> [Int]
getRow a row = map (\col -> a!(row,col)) [1..9]

getCol :: Array(Int, Int) Int -> Int -> [Int]
getCol a col = map (\row -> a!(row,col)) [1..9]

getBox :: Array(Int, Int) Int -> (Int, Int) -> [Int]
getBox a (row,col) = map (\(x,y) -> a!(row'+x,col'+y)) [(x,y) | x <- [0..2], y <- [0..2]]
  where row' = reduce row 3
        col' = reduce col 3

-------------------------------------------
-- reduce is a helper function for getBox.
-- It takes an int along with a base, (for
-- the sudoku solver it will be 3) and then
-- reduces it to 1, 4, or 7. This function
-- is independent of the rows or columns so
-- it can be used for both.
-- 1 -> 1	2 -> 1		3 -> 1
-- 4 -> 4	5 -> 4		6 -> 4
-- 7 -> 7	8 -> 7		9 -> 7
-------------------------------------------
reduce :: Int -> Int -> Int
reduce x base = (base * (quot (x-1) base)) + 1
--same as:     (base * ((x-1) `quot` base)) + 1

-------------------------------------------
-- These 3 functions (avail___Nums) take a
-- corresponding row, column or box as a list
-- and return the complement.
-------------------------------------------
availRowNums :: Array(Int, Int) Int -> Int -> Set.Set Int
availRowNums a row = getCompNums $ getRow a row

availColNums :: Array(Int, Int) Int -> Int -> Set.Set Int
availColNums a col = getCompNums $ getCol a col

availBoxNums :: Array(Int, Int) Int -> (Int, Int) -> Set.Set Int
availBoxNums a (row,col) = getCompNums $ getBox a (row,col) 

-------------------------------------------
-- availAll compiles the row, col and box
-- sets and find the intersection of all
-- three (i.e. if a value is each set then
-- it is a viable answer)
-------------------------------------------
availAll :: Array(Int, Int) Int -> (Int, Int) -> [Int]
availAll a (row,col) = 
  Set.toList $ Set.intersection fromBox $ Set.intersection fromRow fromCol
  where fromRow = availRowNums a row
        fromCol = availColNums a col
	fromBox = availBoxNums a (row,col)

-----------------------------------------------
-- This checks to see if there are any unsolved
-- cells in the board, and returns false if 
-- there are.
-----------------------------------------------
isSolved :: Array(Int, Int) Int -> (Int, Int) -> Bool
isSolved a (row,  10) = isSolved a (row + 1, 1)
isSolved a ( 10,  _ ) = True
isSolved a (row, col) = 
  case a!(row, col) of 0 -> False
		       _ -> isSolved a (row, col + 1)

-------------------------------------------
-- This is the meat of the program...every-
-- thing else helps the solver function.
-------------------------------------------
solveBoard :: Array(Int, Int) Int -> (Int, Int) -> Array(Int, Int) Int
solveBoard a (row, 10 ) = solveBoard a (row + 1, 1)
solveBoard a ( 10,  _ ) = 
  case done of False -> solveBoard a (1 , 1)
               True  -> a
  where done = isSolved a (1, 1)
solveBoard a (row, col) = 
  case a!(row,col) of
    0 -> solveBoard (findValue a (row, col)) (row, col + 1)
    _ -> solveBoard a (row, col + 1)

-------------------------------------------
-- This function takes the list of complement
-- numbers for an index and if the length
-- is 1 puts that value into the array and 
-- moves to the next cell.
-------------------------------------------
findValue :: Array(Int, Int) Int -> (Int, Int) -> Array(Int, Int) Int
findValue a (row, col) = 
  case length $ listAvail of
    1 -> a//[((row,col),head $ listAvail)]
    _ -> solveBoard a (row, col + 1)
  where listAvail = availAll a (row, col)
