# Name: Eric Pereira
# Scipy version of MonteCarlo

import scipy

N = 100000

x_array = scipy.random.rand(N)
y_array = scipy.random.rand(N)

N_qtr_circle = sum(x_array**2 + y_array**2 < 1)

r = 1

pi_approx = 4*float(N_qtr_circle)/N

print (pi_approx)