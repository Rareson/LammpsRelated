LammpsRelated
=============


This repository is devoted to tricks closely related to LAMMPS.

I've written a simple GUI for this repository. After cloning this repository, you can
try it with the command with a termial under the path where you put the repository:

	python gui.py

With a little knowledge of Python and Bash, reading the source code of gui.py,
you can easily have a good idea of how I implemented these processes,
such as how these packages are installed, how to test these examples. So I'll
write no README files under every example due to my lacking of time.


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

	cd ~/Documents/code/testInput/
	../compiled/lmp_serial<~/Documents/code/testInput/ex02.input


installLAMMPS.sh
---------------
This script is unfinished.

This script is intended for full installation of LAMPPS with all its functionalities anabled.

But some problems are still unresolved. Sorry for any confusion or inconvenience.

Acknowledgements
----------------
Cu_u3.eam and ex02.input are provided by my teacher.
