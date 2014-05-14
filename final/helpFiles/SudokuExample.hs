import System
import Control.Monad
import Data.List
import Data.Array.IO
 
type SodokuBoard = IOArray Int Int
 
main = do
    [f] <- getArgs
    a <- newArray (1, 81) 0
    readFile f >>= readSodokuBoard a
    putStrLn "Original:"
    printSodokuBoard a
    putStrLn "Solutions:"
    solve a (1,1)
 
readSodokuBoard a xs = sequence_ $ do (i,ys) <- zip [1..9] (lines xs)
                                      (j,n)  <- zip [1..9] (words ys)
                                      return $ writeBoard a (j,i) (read n)
 
printSodokuBoard a =
   let printLine a y = mapM (\x -> readBoard a (x,y)) [1..9] >>= mapM_ (putStr . show)
   in  do
     putStrLn "-----------"
     mapM_ (\y -> putStr "|" >> printLine a y >> putStrLn "|") [1..9]
     putStrLn "-----------"
 
-- the meat of the program.  Checks the current square.
-- If 0, then get the list of nums and try to "solve' "
-- Otherwise, go to the next square.
solve :: SodokuBoard  -> (Int, Int) -> IO (Maybe SodokuBoard)
solve a (10,y) = solve a (1,y+1)
solve a (_, 10)= printSodokuBoard a >> return (Just a)
solve a (x,y)  = do v <- readBoard a (x,y)
                    case v of
                      0 -> availableNums a (x,y) >>= solve' a (x,y)
                      _ ->  solve a (x+1,y)
     -- solve' handles the backtacking
  where solve' a (x,y) []     = return Nothing
        solve' a (x,y) (v:vs) = do writeBoard a (x,y) v   -- put a guess onto the board
                                   r <- solve a (x+1,y)
                                   writeBoard a (x,y) 0   -- remove the guess from the board
                                   solve' a (x,y) vs      -- recurse over the remainder of the list
 
-- get the "taken" numbers from a row, col or box.
getRowNums a y = sequence [readBoard a (x',y) | x' <- [1..9]]
getColNums a x = sequence [readBoard a (x,y') | y' <- [1..9]]
getBoxNums a (x,y) = sequence [readBoard a (x'+u, y'+v) | u <- [0..2], v <- [0..2]] 
  where x' = (3 * ((x-1) `quot` 3)) + 1
        y' = (3 * ((y-1) `quot` 3)) + 1
 
-- return the numbers that are available for a particular square
availableNums a (x,y) = do r <- getRowNums a y 
                           c <- getColNums a x
                           b <- getBoxNums a (x,y)
                           return $ [0..9] \\ (r `union` c `union` b)  
 
-- aliases of read and write array that flatten the index
readBoard a (x,y) = readArray a (x+9*(y-1))
writeBoard a (x,y) e = writeArray a (x+9*(y-1)) e
