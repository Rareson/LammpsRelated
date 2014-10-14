# To verify the degree:
from numpy import *
import pylab as pl
import sys
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import MultipleLocator, FormatStrFormatter

filepath = sys.argv[1] 
myfile = open(filepath)
i=0;
xRange = arange(0, 0.063, 0.003)
xData = arange(0, 0.063, 0.003)
yData = xData
orderTest = [2,3,4,5,6,7,8,9,10,11,12]
C11 = []
for line in myfile.readlines():
    data = line.split()
    yData[i] = data[0]
    i = i+1
    
i=0
for orderItem in orderTest:    
    plsq = np.polyfit(xRange,yData,orderItem)
    print(plsq)
    C11.append(plsq[len(plsq)-3]*2*1000/(363077*6.2415))
    print 'the result C11 is', C11[i], 'GPa',
    'with Degree',orderItem
    i=i+1

plt.plot(orderTest, C11,'-or')
plt.title('Polynomial fitting with different order to elastic data')
plt.xlabel(r'Degree of polynomial')
plt.ylabel('Young\'s Modulus/GPa')
plt.gca().xaxis.set_minor_locator(MultipleLocator(1))
plt.gca().xaxis.grid(True,which='minor')

plt.show()

