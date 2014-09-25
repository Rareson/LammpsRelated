LammpsRelated
=============


This repository is devoted to tricks closely related to LAMMPS.

installClass.sh
---------------
The script "installClass" provides the minimum working environment for LAMMPS as
required in my Computational Materials course.

Usage:
(Replace "~/Documents/code" by the path where you put the repository.)
	cd ~/Documents/code
	chmod +x ./installClass.sh
	./installClass.sh

After this, the lmp_serial is located in a file folder named "compiled".

You can test it with:
	(Replace "~/Documents/code" by the path where you put the repository.)

	cd /Documents/code/testInput/
	../compiled/lmp_serial<~/Documents/code/testInput/ex02.input


installLAMMPS.sh
---------------


Acknowledgements
----------------
Cu_u3.eam and ex02.input are provided by my teacher.
