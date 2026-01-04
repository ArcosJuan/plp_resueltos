-- Sea g :: [a] -> b definida por dos ecuaciones:
-- g []       = <caso base>
-- g (x : xs) = <caso recursivo>
--
-- g está dada por recursión estructural  si:
-- 1. El caso base devuelve un valor z "fijo" (no depende de g)
-- 2. El caso recursivo no puede usar las variables g ni xs, salvo en la expresión (g xs)
--
-- La función elementosEnPosicionesPares no utiliza recursión estructural
-- porque:
-- El caso recursivo solo puede utilizar elementosEnPosicionesPares y xs
-- en la expresión elementosEnPosicionesPares xs.
-- Pero los utiliza en la expresión elementosEnPosicionesPares (tail xs)
--
-- La función entrelazar si utiliza recursión estructural porque:
-- 1. El caso base devuelve id que es un valor fijo que no depende
--    de entrelazar.
-- 2. El caso recursivo solo utiliza entrelazar y xs en la expresión
--    entrelazar xs
--
--
-- Implementacion con foldr:
entrelazar :: [a] -> [a] -> [a]
entrelazar = foldr (\x rec -> \ys -> if null ys then [x] else x : head ys : rec (tail ys)) id



