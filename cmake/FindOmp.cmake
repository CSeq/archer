#
# Copyright (c) 2015-2017, Lawrence Livermore National Security, LLC.
#
# Produced at the Lawrence Livermore National Laboratory
#
# Written by Simone Atzeni (simone@cs.utah.edu), Joachim Protze
# (joachim.protze@tu-dresden.de), Jonas Hahnfeld
# (hahnfeld@itc.rwth-aachen.de), Ganesh Gopalakrishnan, Zvonimir
# Rakamaric, Dong H. Ahn, Gregory L. Lee, Ignacio Laguna, and Martin
# Schulz.
#
# LLNL-CODE-727057
#
# All rights reserved.
#
# This file is part of Archer. For details, see
# https://pruners.github.io/archer. Please also read
# https://github.com/PRUNERS/archer/blob/master/LICENSE.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#    Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the disclaimer below.
#
#    Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the disclaimer (as noted below)
#    in the documentation and/or other materials provided with the
#    distribution.
#
#    Neither the name of the LLNS/LLNL nor the names of its contributors
#    may be used to endorse or promote products derived from this
#    software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL LAWRENCE
# LIVERMORE NATIONAL SECURITY, LLC, THE U.S. DEPARTMENT OF ENERGY OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

include(FindPackageHandleStandardArgs)

# use an explicitly given omp path first
FIND_PATH(OMP_INCLUDE_PATH omp.h
            PATHS ${OMP_PREFIX}/include ${LLVM_ROOT}/include ${CMAKE_BINARY_DIR}/projects/openmp/runtime/src ${CMAKE_BINARY_DIR}/include /usr /usr/local}
            PATH_SUFFIXES include NO_DEFAULT_PATH)
# if not-found, try again at cmake locations
FIND_PATH(OMP_INCLUDE_PATH omp.h)

find_package_handle_standard_args(OpenMP DEFAULT_MSG OMP_INCLUDE_PATH )

# use an explicitly given omp path first
FIND_PATH(OMP_LIB_PATH libomp.so
            PATHS ${OMP_PREFIX}/lib ${LLVM_ROOT}/lib ${CMAKE_INSTALL_PREFIX}/lib /usr /usr/local}
            PATH_SUFFIXES lib NO_DEFAULT_PATH)
# if not-found, try again at cmake locations
FIND_PATH(OMP_LIB_PATH libomp.so)

find_package_handle_standard_args(OpenMP DEFAULT_MSG OMP_LIB_PATH )
