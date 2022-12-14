# Name: Eric Pereira
# problem 4.18

from scipy.stats import norm

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