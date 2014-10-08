import sys

def ex02_process_data(path):
    """This is for extracting data from the log.lammps
    
    Originally found in http://www.cnblogs.com/bacazy/archive/2013/09/28/3344687.html
    Modified by Domicor (g1114128525@gmail.com) in Nov. 3, 2014."""
    b = 2
    f = open(path);
    fw = open(path + '.output', 'w')
    for line in f.readlines():
        b = b+1
        if 'Energy initial' in str(line):
            b = 0;
        if b == 1:
            print(line)
            fw.write(line)
            
ex02_process_data(sys.argv[1])
