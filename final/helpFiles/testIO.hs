import Data.Char
import System.IO
import ConvertLine

main = do
  putStrLn "Getting first line of the sudoku puzzle: "
  handle <- openFile "sudoku1.txt" ReadMode
  line1 <- hGetLine handle      
  putStrLn ("The first line is: " ++ show(str2intlist line1))

-- prints diagonal...
--(putStr . show) $ zipWith (\(x,y) -> testArr!(x,y)) [(x,y) |  x<-[1..9], y<-[1..b]

--Rosetta Code: Printing an array to IO()
--main = mapM_ putStrLn $ zipWith3 (\a b c -> [a,b,c]) "abc" "ABC" "123"

--prints whole board as a line...
--map (\(x,y)->testArr!(x,y))[(x,y) | x<-[1..9],y<-[1..9]]
