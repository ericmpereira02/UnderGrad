# Name: Eric Pereira
# normal python version of MonteCarlo

import random
import math
import scipy
from scipy.stats import binom
from scipy.stats import norm
from scipy.stats import poisson


print("This is the normal MonteCarlo")

inCircle = 0

for item in range(1000000):
    x = random.random()
    y = random.random()
    
    d = math.sqrt(x**2 + y**2)
    
    if d <= 1:
        inCircle += 1
    
pi = (inCircle / 1000000) * 4

print(pi)

#output is: 3.141652

# Scipy version of MonteCarlo

print("This is the scipy MonteCarlo")

N = 1000000

x_array = scipy.random.rand(N)
y_array = scipy.random.rand(N)

N_qtr_circle = sum(x_array**2 + y_array**2 < 1)

r = 1

pi_approx = 4*float(N_qtr_circle)/N

print (pi_approx)

#output is: 3.142264

# problem 3.20

print("These are the answers to all 3.20")

#answer to a
print("a is: " + str(binom.pmf(3, 20, .05, 0)))

#output is: a is: 0.0595821477687

# problem 3.24
print("These are the answers to all 3.24")

#answer to a
answertoa = 0
for ii in range(5, 10):
    answertoa += binom.pmf(ii, 10, .2, 0)
    
print("a is: " + str(answertoa))

#answer to b
print("b is: " + str(binom.cdf(1, 4, .2, 1)))
    
#output to 3.24 is 
#a is: 0.0327933952
#b is: 0.4096

# problem 3.31

print("These are the answers to all 3.31")

#answer to a
print("a is: " + str(binom.sf(18, 20, .8, 1)))

#answer to b
print("b is: " + str(1/0.8))

#output is
#a is: 0.206084718948
#b is: 1.25

# problem 3.33
print("These are the answers to all 3.33")

#answer to a
print("a is: " + str(1 - poisson.cdf(2,3)))

#answer in b
answerforb = 1
for ii in range(0,3):
        answerforb -= binom.pmf(ii, 12, .1947)
print("b is: " + str(answerforb))

#output is:
#a is: 0.576809918873
#b is: 0.422817875821

# problem 4.16

print("These are the answers to all 4.16")

#answer to a
print("a is: " + str(norm.cdf(1.25, 0, 1)))

#answer to b
print("b is: " + str(norm.cdf(1.25, 0, 1)))

#answer to c
print("c is: " + str(norm.sf(1.25, 0, 1)))

#answer to d
print("d is: " + str(norm.cdf(1.25, 0, 1) - (norm.sf(1.25, 0, 1))))

#answer to e
print("e is: " + str(norm.cdf(6, 0, 1)))

#answer to f
print("f is: " + str(norm.sf(6, 0, 1)))

#answer to g
print("g is: " + str(norm.ppf(.80, 0, 1)))

#output is:
#a is: 0.894350226333
#b is: 0.894350226333
#c is: 0.105649773667
#d is: 0.788700452666
#e is: 0.999999999013
#f is: 9.86587645038e-10
#g is: 0.841621233573

# problem 4.18
print("These are the answers to all 4.18")
expected = -3
variance = 4
stdev = 2

#answer to a
print("a is: " + str(norm.cdf(2.39, expected, stdev)))

#answer to b
print("b is: " + str(norm.sf(-2.39)))

#answer to c
print("c is: " + str(norm.sf(2.39, expected, stdev) + norm.cdf(-2.39, expected, stdev)))

#answer to d
print("d is: " + str(norm.sf(.61, expected, stdev) + norm.cdf(-5.39, expected, stdev)))

#answer to e
print("e is: " + str(norm.cdf(5, expected, stdev)))

#answer to f
print("f is: " + str(norm.cdf(5, expected, stdev) - norm.cdf(-5, expected, stdev)))

#answer to g
print("g is: " + str(norm.ppf(.33, expected, stdev)))

#output for 4.18 is
#a is: 0.996480568448
#b is: 0.991575813601
#c is: 0.623336355393
#d is: 0.151580856075
#e is: 0.999968328758
#f is: 0.841313074827
#g is: -3.87982633135

# problem 4.21
print("These are the answers to all 4.21")

expected = 79
variance = 3.89

#answer to a
x = 84
z = (x - expected) / variance
print("a is: " + str(norm.sf(z)))

#answer for b
z = .84
x = (z*variance) + expected
print("b is: " + str(x))

#output for 4.21 is 
#a is: 0.0993355188736
#b is: 82.2676

# problem 4.24

print("These are the answers to all 4.24")

#answer to a
print("a is: " + str(norm.sf(abs(-.828))))
#a is: 0.203835249947

# problem 4.25

print("These are the answers to all 4.25")

#answer to a
print("a is: " + str(norm.cdf(25.5,24,4.75) - norm.cdf(19.5,24,4.75)))
print("a is also: " + str(binom.cdf(25.5,400,.06) - binom.cdf(19.5,400,.06)))

#answer to b
print("b is: " + str(binom.sf(40, 400, .45)))
print("b is also: " + str(norm.sf(7.5,18.3,15)))

#output is
#a is: 0.452193307394
#a is also: 0.462130795742
#b is: 1.0
#b is also: 0.764237502221
