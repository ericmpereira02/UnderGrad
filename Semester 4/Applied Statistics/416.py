# Name: Eric Pereira
# problem 4.16

from scipy.stats import norm

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