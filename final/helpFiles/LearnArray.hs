--------------------------------------------
-- Learning about arrays...
--------------------------------------------
defArray :: Int -> Int -> Array (Int, Int) Int
defArray a b =
  array ((1,1),(a,b)) [ ( (i,j),i+j ) | i<-[1..a], j<-[1..b] ]

