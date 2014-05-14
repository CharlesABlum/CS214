s = "2 4\n6 8"

s' :: [Int]
s' = (map read . words) s

let arr = listArray ((1,1),(2,2)) s'
