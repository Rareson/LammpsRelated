./lmp_serial_mine < homework.input
grep ^@ log.lammps |sed 's/@ //g' >  homework_processed.data
# matlab calLatticeConstant(3,0.01,'homework_processed.data')

lat_const =

    3.5659


coh_energy =

   -7.3682
# the real is: 3.567. from http://www.52souji.net/lattice-constants-for-all-elements/
# good result.

# Bulk modulus: K
# Young's modulus, tensile modulus, elastic modulus: E
# Poisson's ratio: v
# Shear modulus: G
# The relation between them: E=3K(1-2v)=2G(1+v)

So to calculate Young's modulus: 
./lmp_serial_mine < homework_Young.input
python ex02_process_data.py '/home/domicor/Documents/code/compiled/examples_for_lmps/homework/log.lammps'
python fittingPoly.py '/home/domicor/Documents/code/compiled/examples_for_lmps/homework/log.lammps.output'

# The result is 1056.94415775 GPa
# Experimental: ~1200 from wikipedia: http://en.wikipedia.org/wiki/Young%27s_modulus
# www.chinabaike.com/z/yj/636670.html. around 1100GPa

