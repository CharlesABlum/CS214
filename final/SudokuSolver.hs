import System.Environment
import SudokuIO
import SudokuOperations

main = do
  [args] <- getArgs
  readAndSolve args 9 9
