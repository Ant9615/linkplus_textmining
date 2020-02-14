library(lpSolve)

"
obj to. max
z=x1+9x2+x3 

subj to.
x1+2x2+3x3 <=9
3x1+2x2+2x3<=15
"

# model
f.obj <- c(1,9,1)
f.con<-matrix(c(1,2,3,3,2,2), nrow = 2, byrow = T)
f.dir <- c("<=","<=")
f.rhs <-c(9,15)

# solve
lp("max",f.obj,f.con,f.dir,f.rhs) # 목적함수 값
lp("max",f.obj,f.con,f.dir,f.rhs)$solution # 변수 솔루션

# other same
f.con.d <- matrix(c(rep(1:2, each=3), rep(1:3,2),t(f.con)), ncol=3)
lp("max",f.obj, ,f.dir,f.rhs,dense.const = f.con.d)