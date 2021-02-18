#!/usr/bin/env bash
# Source: https://github.com/pypa/python-manylinux-demo/blob/master/travis/build-wheels.sh
# Must be run inside container quay.io/pypa/manylinux1_x86_64
set -v

pythonversion=$1

# Install system packages required by the library

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib64"

# Compile wheel
"/opt/python/cp${pythonversion}-cp${pythonversion}${packaging}/bin/pip" wheel -v statsmodels==0.12.0 -w wheelhouse/

# Bundle external shared libraries into the wheel
auditwheel repair wheelhouse/statsmodels-*-cp${pythonversion}-cp${pythonversion}-linux_aarch64.whl -w /io/wheelhouse/
