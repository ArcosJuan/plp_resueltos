data Expr = EConstNum Int | EAdd Expr Expr

eval :: Expr -> Int
eval (EConstNum x) = x
eval (EAdd x y) = eval x + eval y
