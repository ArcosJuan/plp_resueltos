-- I)

permutaciones :: [a] -> [[a]]
permutaciones = foldr (\x rec -> concatMap (mezcla x) rec) [[]]

mezcla :: a -> [a] -> [[a]]
mezcla x xs = foldr (\n rec -> ((take n xs) ++ x : (drop n xs)):rec ) [] [0..(length xs)]

-- II)

partes :: [a] -> [[a]]
partes = foldr (\x rec ->  rec++(map (x:) rec)) [[]]

-- III)

-- Con foldl
prefijos :: [a] -> [[a]]
prefijos = foldl (\rec x -> rec++[(last rec)++[x]]) [[]]

-- Con foldr
prefijos2 :: [a] -> [[a]]
prefijos2 xs = foldr (\x rec -> (take x xs):rec) [[]]  [1..(length xs)]

-- IV)
sublistas :: [a] -> [[a]]
sublistas xs = foldr (\x rec -> (tail (prefijos (drop x xs))) ++ rec) [[]] [0..(length xs)]


