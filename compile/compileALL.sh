#!/bin/bash
# This script is unfinished.

# This script is intended for full installation of LAMPPS with all its functionalities anabled.

# But some problems are still unresolved. Sorry for any confusion or inconvenience.

workingDir=/home/domicor/Documents/code

# Prepare necessary prerequisites.
sudo apt-get install g++
sudo apt-get install gfortran
sudo apt-get install mpich2
sudo apt-get install libnvvm2 # for nvcc
sudo apt-get install nvidia-cuda-toolkit # for nvcc. need about 270M.

# sudo gedit /etc/profile
# or sudo gedit ~/.bashrc
# add: PATH=$PATH:/usr/local/cuda/bin/
export PATH="/usr/local/cuda/bin/:$PATH"
source /etc/profile
echo $PATH

# Prepare mean and reax
cd $workingDir/lammps-28Jun14/lib/atc
make -f Makefile.g++

cd $workingDir/lammps-28Jun14/lib/awpmd
make -f Makefile.openmpi

cd $workingDir/lammps-28Jun14/lib/colvars
make -f Makefile.g++

cd $workingDir/lammps-28Jun14/lib/cuda # This is for GPU compuation.
# whereis nvcc
# gedit /home/domicor/Documents/code/lammps-28Jun14/lib/cuda/Makefile.common
# CUDA_INSTALL_PATH = /usr
make precision=1 arch=20 prec_timer=0 dbg=0 cufft=1
make # you can also add some OPTIONS (Refer to README)

cd $workingDir/lammps-28Jun14/lib/gpu # This is for GPU compuation.
# gedit /home/domicor/Documents/code/lammps-28Jun14/lib/gpu/Makefile.linux
# CUDA_HOME = /usr
# but make: *** No rule to make target `lal_coul.h', needed by `lal_coul.o'.  Stop.
make -f Makefile.linux

cd $workingDir/lammps-28Jun14/lib/kokkos # Advanced features. Multi-core.
# gedit /home/domicor/Documents/code/lammps-28Jun14/lib/kokkos/Makefile.lammps
# CUDA_PATH = /usr
# and do nothing else.

cd $workingDir/lammps-28Jun14/lib/linalg
make -f Makefile.gfortran

cd $workingDir/lammps-28Jun14/lib/meam
make -f Makefile.gfortran

cd $workingDir/lammps-28Jun14/lib/poems
make -f Makefile.g++

cd $workingDir/lammps-28Jun14/lib/qmmm
make -f Makefile.gfortran

cd $workingDir/lammps-28Jun14/lib/reax
make -f Makefile.gfortran


################################################################################
################################################################################
################################################################################

# To see all the packages that are loaded type:
# make package-status
# The following codes need further testing.
# You don't directly copy the files generated in lib after the make process,
# because the compiling process will link back to it directly.
# cp libmeam.a $workingDir/lammps-28Jun14/src/MEAM
# cp Makefile.lammps $workingDir/lammps-28Jun14/src/MEAM
cd $workingDir/lammps-28Jun14/src
make no-all
make yes-all
make no-gpu
# make no-cuda
make no-kokkos #../kokkos_type.h:52:12: error: ‘struct float4’ has a previous declaration as ‘struct float4’
make no-user-awpmd

make yes-meam
make yes-reax

# Inclusion/exclusion of a package works by simply copying files to the main
# main src directory from sub-directories with the package name(e.g. src/KSPACE,
# src/USER-ATC), or removing these files from the main src directory, 
# so that the files are seen or not seen when LAMMPS is built.

# make and then compile the final lammps executable.
cd $workingDir/lammps-28Jun14/src/STUBS
make
cd ..
make serial

mkdir $workingDir/lammps-28Jun14/compiled/
cp lmp_serial $workingDir/lammps-28Jun14/compiled/lmp_serial

lmpDir=$workingDir/lammps-28Jun14/compiled
lmpSampleDir=$workingDir/lammps-28Jun14/examples
$lmpDir/lmp_serial < $lmpSampleDir/body/in.body #ERROR: Invalid body style (../atom_vec_body.cpp:95)

# parallel job
cd $workingDir/lammps-28Jun14/src
make linux
mpirun -np 4 $lmpDir/lmp_serial < $lmpSampleDir/bench/in.lj

# test the bench
$lmpDir/lmp_serial < $workingDir/lammps-28Jun14/bench/in.rhodo #failed

# other tests
$lmpDir/lmp_serial < $lmpSampleDir/colloid/in.colloid #failed

$lmpDir/lmp_serial < $lmpSampleDir/comb/in.comb.Si #failed

$lmpDir/lmp_serial < $lmpSampleDir/friction/in.friction #success. dump failed.

$lmpDir/lmp_serial -h # to view what are recognized by this executable.

$lmpDir/lmp_serial < $lmpSampleDir/friction/in.friction

# atomEye
cd /home/domicor/Downloads
chmod +x ./atomeye
sudo ./atomeye cnt8x3.cfg #good

#
potentials-> those that can be handled.

cd /home/domicor/Documents/MaterialsStudio70
install # too time consuming.
