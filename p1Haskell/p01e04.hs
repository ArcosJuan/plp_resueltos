permutaciones :: [a] -> [[a]]
permutaciones = foldr (\x rec -> concatMap (mezcla x) rec) [[]]

mezcla :: a -> [a] -> [[a]]
mezcla x xs = foldr (\n rec -> ((take n xs) ++ x : (drop n xs)):rec ) [] [0..(length xs)]
