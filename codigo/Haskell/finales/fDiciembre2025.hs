data Indice = I1 | I2 | I3
data AT a = Hoja a | Nodo (Indice -> AT a)

foldAT :: (a -> b) -> (b -> b -> b -> b) -> AT a -> b
foldAT fh _ (Hoja x) = fh x
foldAT fh ft (Nodo fi) = ft (foldAT fh ft (fi I1)) (foldAT fh ft (fi I2)) (foldAT fh ft (fi I3))

altura :: AT a -> Integer
altura = foldAT (const 1) (\i1 i2 i3 -> 1 + max i1 (max i2 i3)) 

mapAT :: (a -> b) -> AT a -> AT b
mapAT f = foldAT (\x -> Hoja (f x)) (\i1 i2 i3 -> Nodo (\i -> case i of
                                                                I1 -> i1
                                                                I2 -> i2
                                                                I3 -> i3))
