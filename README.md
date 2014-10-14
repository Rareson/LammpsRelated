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

Repository structure
=====================


compile
---------------
This is where the scripts for compiling LAMMPS are located.


demo
---------------
In this folder, there are some examples which can run with the source package shipped with my release.

doc
-------------
Some notes and documentation (maybe not that formal, I will try).

gui
-------------
GUI related stuff, such as Qt sources files for the GUI and converted python modules used in the GUI.

homework
-----------
This is my first Computational Materials homework. I provide the lyx source file and all listings of source code used in my calculation.

misc
------------
Collections of valuable items that helped with the repository.

project
-----------
My project which is the final test of my Computational Materials course.

pyqtgraph
---------
This is a subtree folder. These files are great for scientific purposes.

tools
--------
Some related useful small tools, such as AtomEye.

Acknowledgements
==============
Books that serves as solid foundation of my coding:
Rapid GUI programming with Python and Qt : the definitive guide to PyQt programming / Mark Summerfield.

Cu_u3.eam and ex02.input are provided by my teacher.
