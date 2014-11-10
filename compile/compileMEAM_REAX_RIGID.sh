
# This script is created by Domicor (g1114128525@gmail.com) to automate the
# installation of two compilers required for LAMMPS and compiling of LAMMPS with specific libraries, i.e. MEAM and REAX.
# Last updated Sep. 25, 2014.

# Usage:
# First move the source package "lammps-28Jun14.tar.gz" into the folder that this script is in.
# chmod +x ./compileMEAM_REAX.sh
# ./compileMEAM_REAX.sh
# After this, the lmp_serial is located in a file folder named "compiled".

# Copyright (C) <2014>  <Domicor>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

workingDir=$(cd `dirname $0`;pwd) # the path where the script is located

sudo apt-get install g++
sudo apt-get install gfortran

tar -xzvf lammps-28Jun14.tar.gz

cd $workingDir/lammps-28Jun14/lib/meam
make -f Makefile.gfortran

cd $workingDir/lammps-28Jun14/lib/reax
make -f Makefile.gfortran

cd $workingDir/lammps-28Jun14/src
make yes-meam
make yes-reax
make yes-rigid

cd $workingDir/lammps-28Jun14/src/STUBS
make
cd ..
make serial

mkdir $workingDir/compiled/
cp lmp_serial $workingDir/compiled/meam_reax_rigid
