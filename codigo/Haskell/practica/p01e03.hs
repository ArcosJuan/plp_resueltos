-- I.
mi_sum :: Num a => [a] -> a
mi_sum = foldr (+) 0

mi_elem :: Eq a => a -> [a] -> Bool
mi_elem e = foldr ((||) . (==e)) False

mi_filter :: (a -> Bool) -> [a] -> [a]
mi_filter f = foldr (\x rec -> if f x then x:rec else rec) []

mi_map :: (a -> b) -> [a] -> [b]
mi_map f = foldr ((:) . f) []

-- II.
mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f = foldr1 (\x rec -> if f x rec then x else rec)

-- III.
sumasParciales :: Num a => [a] -> [a]
sumasParciales = foldr (\x rec -> x:(map (+x) rec)) []

-- IV.
sumaAlt :: Num a => [a] -> a
sumaAlt = foldr (\x rec -> x + rec*(-1)) 0 

-- V.
sumaAltInv :: Num a => [a] -> a
sumaAltInv = foldl (\rec x -> x + rec*(-1)) 0 



