import numpy as np
import fastree
import matplotlib.pyplot as plt
from mpi4py import MPI

N= 10000
eps =0.000001

theta = 0.5
min_n = 10
p = np.random.rand(N,3)
m = np.random.rand(N)

comm = MPI.COMM_WORLD
rank = comm.Get_rank()

mpi = fastree.mpi_treecode(p,m,eps,theta,min_n)
if rank == 0:
    print(mpi)
