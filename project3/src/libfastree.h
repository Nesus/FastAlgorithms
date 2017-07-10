#ifndef FASTREE_LIB_H
#define FASTREE_LIB_H

// Calculate the potential using direct summation
void c_direct_sum(int N, double* potential,double* x,double* y,double* z,double* m, double eps2);


// Treecode implementation
void c_treecode(double THETA,int N_CRIT,int N, double* potential,double* x,double* y,double* z,double* m, double eps2);

// Treecode MPI Implementation
void c_mpi_treecode(double THETA,int N_CRIT,int N, double* potential,double* x,double* y,double* z,double* m, double eps2);

#endif
