#!/bin/bash

COMPUTE_RUNTIME_VERSION=21.50.21939
GMMLIB_VERSION=22.0.0
IGC_VERSION=1.0.9441
LEVEL_ZERO_VERSION=1.2.21939

rm -rf ./debs
mkdir ./debs
cd ./debs

wget https://github.com/intel/compute-runtime/releases/download/${COMPUTE_RUNTIME_VERSION}/intel-gmmlib_${GMMLIB_VERSION}_amd64.deb
wget https://github.com/intel/intel-graphics-compiler/releases/download/igc-${IGC_VERSION}/intel-igc-core_${IGC_VERSION}_amd64.deb
wget https://github.com/intel/intel-graphics-compiler/releases/download/igc-${IGC_VERSION}/intel-igc-opencl_${IGC_VERSION}_amd64.deb
wget https://github.com/intel/compute-runtime/releases/download/${COMPUTE_RUNTIME_VERSION}/intel-opencl-icd_${COMPUTE_RUNTIME_VERSION}_amd64.deb
wget https://github.com/intel/compute-runtime/releases/download/${COMPUTE_RUNTIME_VERSION}/intel-level-zero-gpu_${LEVEL_ZERO_VERSION}_amd64.deb