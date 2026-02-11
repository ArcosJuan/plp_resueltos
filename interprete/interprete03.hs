type Id = String
type Env a = [(Id, a)]  

data Expr = EConstNum Int 
          | EConstBool Bool
          | EAdd Expr Expr 
          | EVar Id
          | ELet Id Expr Expr
            deriving Show

data Val = VN Int
         | VB Bool deriving Show


emptyEnv :: Env a
emptyEnv = []

lookupEnv :: Env a -> Id -> a
lookupEnv ((x,y):xs) id = if x == id then y else lookupEnv xs id

extendEnv :: Env a -> Id -> a -> Env a
extendEnv e id v = if elem id (map (\(x, y) -> x) e)
                   then foldr (\(x, y) xs -> if x == id then (x, v):xs else (x, y):xs) [] e
                   else (id, v) : e

eval :: Expr -> Env Val -> Val
eval (EVar id) env = lookupEnv env id
eval (ELet id e1 e2) env = eval e2 (extendEnv env id (eval e1 env))
eval (EConstNum x) _ = VN x
eval (EConstBool x) _ = VB x
eval (EAdd x y) env = case (eval x env) of
                    VN x -> case (eval y env) of
                              VN y -> VN (x + y)
                    VB x -> case (eval y env) of
                              VB y -> VB (x || y)


