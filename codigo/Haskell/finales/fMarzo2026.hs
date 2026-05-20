data AdjAB a = Raiz a [AB a] | Adj [AB a]
data AB a = Nil | Hoja a | Arb a (AB a) (AB a)

-- a)
foldAB :: b -> (a -> b) -> (a -> b -> b -> b) -> AB a -> b
foldAB z _ _ (Nil) = z
foldAB _ fh _ (Hoja x) = fh x
foldAB z fh fa (Arb x ab1 ab2) = fa x (foldAB z fh fa ab1) (foldAB z fh fa ab2)

foldAdjAB :: b -> (a -> b) -> (a -> b -> b -> b) -> (a -> [b] -> c) -> ([b] -> c) -> AdjAB a -> c
foldAdjAB z fh far fr fad (Raiz x xs) = fr x (map (foldAB z fh far) xs)
foldAdjAB z fh far fr fad (Adj xs) = fad (map (foldAB z fh far) xs)

-- b)
mapAdjAB :: (a -> b) -> AdjAB a -> AdjAB b
mapAdjAB f = foldAdjAB Nil (\x -> Hoja (f x)) (\x rec1 rec2 -> Arb (f x) rec1 rec2) 
                               (\x recs -> Raiz (f x) recs)
                               (\recs -> Adj recs)

-- c)
recAB :: b -> (a -> b) -> (a -> AB a -> AB a -> b -> b -> b) -> AB a -> b
recAB z _ _ (Nil) = z
recAB _ fh _ (Hoja x) = fh x
recAB z fh fa (Arb x ab1 ab2) = fa x ab1 ab2 (recAB z fh fa ab1) (recAB z fh fa ab2)

recAdjAB :: b -> (a -> b) -> (a -> AB a -> AB a -> b -> b -> b) 
               -> (a -> [AB a] -> [b] -> c) -> ([AB a] -> [b] -> c) -> AdjAB a -> c
recAdjAB z fh far fr fad (Raiz x xs) = fr x xs (map (recAB z fh far) xs)
recAdjAB z fh far fr fad (Adj xs) = fad xs (map (recAB z fh far) xs)

-- d)
ordenado :: Ord a => AdjAB a -> Bool
ordenado = foldAdjAB (\_ _ -> True) (\x -> \f y -> f y x) 
                          (\x rec1 rec2 -> \f y -> (f x y) && (rec1 (>=) x) && (rec2 (<) x))
                          (\x xs -> and (map (\f -> f (>) x) xs))
                          (\xs -> and (map (\f -> f (\_ _ -> True) undefined) xs))
