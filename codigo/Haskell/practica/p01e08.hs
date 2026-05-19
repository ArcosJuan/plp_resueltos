-- I)
sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat = foldr (\xs rec -> \ys -> (zipWith (+) xs (head ys)) : rec (tail ys)) id

-- II)
transponer :: [[Int]] -> [[Int]]
transponer =  foldr (\x rec -> if null rec then map (:[]) x else zipWith (:) x rec) []
