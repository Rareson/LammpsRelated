# Curve fitting with polyfit
# to use this script, type:
# python fittingPoly.py ./log.lammps.output


from numpy import *
import pylab as pl
import sys
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import MultipleLocator, FormatStrFormatter
# from numpy.polynomial import polynomial as P
# with numpy polynomial - also ok.

# detailed "string format syntax" reference:
# https://docs.python.org/3/library/string.html?highlight=string%20format#string.Formatter.format
# 6.1.3.1 Format Specification Mini-Language

# http://docs.scipy.org/doc/numpy/reference/routines.polynomials.polynomial.html


filepath = sys.argv[1] #filepath="/home/domicor/Documents/code/compiled/examples_for_lmps/ex02_elastic/log.lammps.output"
myfile = open(filepath)
xRange = arange(0, 0.063, 0.003)
xData = arange(0, 0.063, 0.003)
yData = xData
p0 = [197270, 100, 100]
i=0;
for line in myfile.readlines():
    data = line.split()
    #print(data)
    yData[i] = data[0]
    #print(yData[i])
    i = i+1
    
    

plsq = np.polyfit(xRange,yData,5)
#plsq = P.polyfit(xData,yData,2)
#plsq = leastsq(y = a * x**2 + b * x + c, p0,args=(yData, xData))
print(plsq)
print 'the result C11 is', plsq[len(plsq)-3]*2*1000/(377933*6.2415), 'GPa'

fittingFunction = np.poly1d(plsq)
yFitting = fittingFunction(xRange)
#yFitting = P.polyval(xData, plsq)
#print(xData)
#print(xRange)
#print(yFitting)

plt.plot(xRange, yFitting, xRange, yData,'o')
plt.plot(xRange, yFitting)
plt.title('Polynomial fitting with order 5 to elastic data')
plt.legend(['Fitting Curve', 'Raw Data'],'upper left')
plt.xlabel(r'$\epsilon$')
plt.ylabel('Total Engery/eV')
plt.xlim(-0.003,0.063)
plt.ylim(-113350,-112600)
#plt.gca().set_yticks(arange(-113350,-112600, 100))
plt.gca().xaxis.set_minor_locator(MultipleLocator(0.003))
plt.gca().xaxis.set_major_locator(MultipleLocator(0.012))
plt.gca().yaxis.set_major_locator(MultipleLocator(100))
plt.gca().yaxis.set_major_formatter(FormatStrFormatter('%d'))
plt.gca().yaxis.set_minor_locator(MultipleLocator(50))

plt.gca().xaxis.grid(True,which='minor')
plt.show()
#plt.savefig('fitting.jpg',dpi=300)

#plt.clf()
