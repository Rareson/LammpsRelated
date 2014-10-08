# Curve fitting with function: f(x) = ax^2 + bx + c


from numpy import *
from scipy.optimize import leastsq
import pylab as pl
import sys
import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator, FormatStrFormatter
# with user-defined function.

# detailed "string format syntax" reference:
# https://docs.python.org/3/library/string.html?highlight=string%20format#string.Formatter.format
# 6.1.3.1 Format Specification Mini-Language

# http://docs.scipy.org/doc/numpy/reference/routines.polynomials.polynomial.html

def residuals(p, y, x):
    a, b, c = p
    err = y - (a * x**2 + b * x + c)
    return err
    
def peval(x, p):
    """Curve fitting with function: f(x) = ax^2 + bx + c
    
    Reference: http://docs.scipy.org/doc/scipy/reference/tutorial/optimize.html#least-square-fitting-leastsq
    http://www.ibm.com/developerworks/opensource/library/os-python8/"""
    return p[0] * x**2 + p[1] * x + p[2]


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
    print(yData[i])
    i = i+1
    
    
plsq = leastsq(residuals, p0, args=(yData, xRange))
#plsq = leastsq(y = a * x**2 + b * x + c, p0,args=(yData, xData))
print(plsq[0])

yFitting = peval(xRange, plsq[0])
#print(xData)
#print(xRange)
#print(yFitting)
print 'the result C11 is', plsq[0][len(plsq[0])-3]*2*1000/(377933*6.2415), 'GPa'

plt.plot(xRange, yFitting, xRange, yData,'o')
plt.plot(xRange, yFitting)
plt.title('Least-squres fit to elastic data')
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
plt.savefig('fitting.png')

#plt.clf()
