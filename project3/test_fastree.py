import fastree
import numpy as np

N= 1000
eps =0.0001

theta = 0.5
min_n = 10
p = np.random.rand(N,3)
m = np.random.rand(N)

print(fastree.direct_sum(p,m,eps))
print(fastree.treecode(p,m,eps,theta,min_n))
