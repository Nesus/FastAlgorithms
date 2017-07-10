from distutils.core import setup
from distutils.extension import Extension

from Cython.Build import cythonize
import os
import numpy as np

mpi_compile_args = os.popen("mpic++ -c -show").read().strip().split(' ')[2:]
mpi_link_args    = os.popen("mpic++ -show").read().strip().split(' ')[2:]
for compile_arg in mpi_compile_args:
    if compile_arg in mpi_link_args:
        mpi_link_args.remove(compile_arg)

setup(
    name="Treecode MPI Wrapper",
    ext_modules = cythonize(
        Extension(
            "fastree",
            sources=["src/fastree.pyx","src/direct_sum.cpp","src/treecode.cpp", "src/mpi_treecode.cpp"],
            language="c++",
            include_dirs=[np.get_include()],
            extra_compile_args = mpi_compile_args,
            extra_link_args    = mpi_link_args
        )
    )
)
