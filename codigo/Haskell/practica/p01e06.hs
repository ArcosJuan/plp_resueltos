recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x:xs) = f x xs (recr f z xs) 

-- a)
sacarUna :: Eq a => a -> [a] -> [a]
sacarUna e = recr (\x xs rec -> if x == e then xs else x : rec) [] 

-- b)
-- No se puede utilizar el esquema de recursión estructural en sacarUna
-- porque se utiliza xs por fuera de sacarUna xs.

-- c)
insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e = recr (\x xs rec -> if e <= x then e : x : xs else x : rec) []
