import subprocess




def compileMEAM_REAX():
    """ Compile LAMMPS with two libraries: MEAM and REAX
    
    This is the minimum requirement in my Computational Materials course"""
    
    print('Install LAMMPS with package MEAM and REAX, please wait...')
    # the imported module still gets the current path, so I write the compile
    # command this way.
    subprocess.call(["chmod","+x","./compile/compileMEAM_REAX.sh"])
    subprocess.call(["./compile/compileMEAM_REAX.sh"], shell=True)
