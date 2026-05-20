data ABBComp a = Nil | Comp [a] | Nodo a (ABBComp a) (ABBComp a)

-- a)
foldABBComp :: b -> ([a] -> b) -> (a -> b -> b -> b) -> ABBComp a -> b
foldABBComp z _ _ (Nil) = z
foldABBComp _ fc _ (Comp xs) = fc xs
foldABBComp z fc fn (Nodo x abb1 abb2) = fn x (foldABBComp z fc fn abb1) (foldABBComp z fc fn abb2)

-- b)
mapABBComp :: (a -> b) -> ABBComp a -> ABBComp b
mapABBComp f = foldABBComp (Nil) (\xs -> Comp (map f xs)) (\x rec1 rec2 -> Nodo (f x) rec1 rec2)

-- c)
recABBComp :: b -> ([a] -> b) -> (a -> ABBComp a -> ABBComp a -> b -> b -> b) -> ABBComp a -> b
recABBComp z _ _ (Nil) = z
recABBComp _ fc _ (Comp xs) = fc xs
recABBComp z fc fn (Nodo x abb1 abb2) = fn x abb1 abb2 (recABBComp z fc fn abb1) (recABBComp z fc fn abb2)

-- d)
ordenado :: Ord a => ABBComp a -> Bool
ordenado = recABBComp True 
                      (\xs -> foldr (\x rec -> \y -> if y <= x then rec x else False) (const True) (tail xs) (head xs))
                      (\x abb1 abb2 rec1 rec2 -> (comparar (>=) x abb1) && (comparar (<) x abb2) && rec1 && rec2)
  where comparar f x abb = case abb of
                             (Nil) -> True
                             (Comp xs) -> f x (last xs)
                             (Nodo y _ _) -> f x y

-- e)
iguales :: Eq a => ABBComp a -> ABBComp a -> Bool
iguales abb1 abb2 = (alista abb1) == (alista abb2)
  where alista = foldABBComp [] (id) (\x rec1 rec2 -> rec1++[x]++rec2)
