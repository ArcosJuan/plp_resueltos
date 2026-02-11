data Expr = EConstNum Int 
          | EConstBool Bool
          | EAdd Expr Expr deriving Show

data Val = VN Int
         | VB Bool deriving Show

eval :: Expr -> Val
eval (EConstNum x) = VN x
eval (EConstBool x) = VB x
eval (EAdd x y) = case (eval x) of
                    VN x -> case (eval y) of
                              VN y -> VN (x + y)
                    VB x -> case (eval y) of
                              VB y -> VB (x || y)


