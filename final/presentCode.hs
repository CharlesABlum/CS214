-- Example from "Learn you a Haskell for Great Good!"

triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ] 

rightTriangles = [ (a,b,c) | c<-[1..10], b<-[1..c], a<-[1..b], a^2 + b^2 == c^2]

rightTriangles' = [(a,b,c) | c<-[1..10], b<-[1..c], a<-[1..b], a^2+b^2==c^2, a+b+c == 24]

patternMatching :: Int -> String
patternMatching 1 = "One"
patternMatching 2 = "Two"
patternMatching 3 = "Three"
patternMatching 4 = "Four"
patternMatching 5 = "Five"
patternMatching x = "Not 1..5"

recursiveSum :: Int -> Int
recursiveSum 0 = 0
recursiveSum x = x + recursiveSum (x-1)
