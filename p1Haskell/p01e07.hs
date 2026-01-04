-- I)
mapPares :: (a -> b -> c) -> [(a,b)] -> [c]
mapPares f = foldr (\(x, y) rec -> (f x y) : rec) []

-- II)
armarPares :: [a] -> [b] -> [(a,b)]
armarPares = foldr (\x rec -> \xs -> if null xs then [] else (x, head xs) : rec (tail xs)) (\xs -> [])

-- III)
mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f = foldr (\x rec -> \xs -> if null xs then [] else (f x (head xs)) : rec (tail xs)) (\xs -> [])
