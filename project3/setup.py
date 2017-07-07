from distutils.core import setup
from distutils.extension import Extension

from Cython.Build import cythonize
import numpy as np

# cythonize('src/fastree.pyx',language="c++")
# setup(
#     name="Treecode MPI Wrapper",
#     ext_modules = [Extension("fastree",sources=["src/fastree.cpp", "src/direct_sum.cpp","src/treecode.cpp"], language="c++")],
#     include_dirs=[np.get_include()]
# )

setup(
    name="Treecode MPI Wrapper",
    ext_modules = cythonize(
        Extension(
            "fastree",
            sources=["src/fastree.pyx","src/direct_sum.cpp","src/treecode.cpp"],
            language="c++",
            include_dirs=[np.get_include()]
        )
    )
)
