micurry :: ((a, b) -> c) -> a -> b -> c
micurry f x y = f (x, y)

miuncurry :: (a -> b -> c) -> (a,b) -> c 
miuncurry f (x, y) = f x y

