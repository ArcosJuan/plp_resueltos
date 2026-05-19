-- I)
foldNat :: (Integer -> b -> b) -> b -> Integer -> b
foldNat _ z 0 = z
foldNat f z n = f n (foldNat f z (n-1))

-- II)
potencia :: Integer -> Integer -> Integer
potencia n = foldNat (\x rec -> n * rec) 1
