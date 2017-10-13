from distutils.core import setup, Extension

setup(ext_modules=[Extension("_trilateration_core",
      sources=["trilateration_core.c", "trilateration_core.i"])])
