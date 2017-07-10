import cython

import numpy as np
cimport numpy as np

cdef  extern from "libfastree.h":

  void c_direct_sum(int N, double* potential,double* x,double* y,double* z,double* m, double eps2)

  void c_treecode(double THETA,int N_CRIT,int N, double* potential,double* x,double* y,double* z,double* m, double eps2)

  void c_mpi_treecode(double THETA,int N_CRIT,int N, double* potential,double* x,double* y,double* z,double* m, double eps2);

"""
Direct Summation
"""
def direct_sum(np.ndarray[double,ndim=2,mode="c"] particles, np.ndarray[double,ndim=1,mode="c"] mass, eps2):
  cdef np.int32_t n = particles.shape[0]
  cdef np.ndarray[double,ndim=1] potential = np.zeros(n,dtype=np.float64)
  cdef np.ndarray[double,ndim=1] x = particles[:,0]
  cdef np.ndarray[double,ndim=1] y = particles[:,1]
  cdef np.ndarray[double,ndim=1] z = particles[:,2]

  c_direct_sum(<int> n, <double*> &potential[0], <double*> &x[0], <double*> &y[0], <double*> &z[0], <double*> &mass[0],<double> eps2);

  return potential


def treecode(np.ndarray[double,ndim=2,mode="c"] particles, np.ndarray[double,ndim=1,mode="c"] mass, eps2, theta, min_particles):
  cdef np.int32_t n = particles.shape[0]
  cdef np.ndarray[double,ndim=1] potential = np.zeros(n,dtype=np.float64)
  cdef np.ndarray[double,ndim=1] x = particles[:,0]
  cdef np.ndarray[double,ndim=1] y = particles[:,1]
  cdef np.ndarray[double,ndim=1] z = particles[:,2]

  c_treecode(<double> theta,<int> min_particles,<int> n, <double*> &potential[0],<double*> &x[0], <double*> &y[0], <double*> &z[0], <double*> &mass[0],<double> eps2)

  return potential

def mpi_treecode(np.ndarray[double,ndim=2,mode="c"] particles, np.ndarray[double,ndim=1,mode="c"] mass, eps2, theta, min_particles):
  cdef np.int32_t n = particles.shape[0]
  cdef np.ndarray[double,ndim=1] potential = np.zeros(n,dtype=np.float64)
  cdef np.ndarray[double,ndim=1] x = particles[:,0]
  cdef np.ndarray[double,ndim=1] y = particles[:,1]
  cdef np.ndarray[double,ndim=1] z = particles[:,2]

  c_mpi_treecode(<double> theta,<int> min_particles,<int> n, <double*> &potential[0],<double*> &x[0], <double*> &y[0], <double*> &z[0], <double*> &mass[0],<double> eps2)

  return potential
