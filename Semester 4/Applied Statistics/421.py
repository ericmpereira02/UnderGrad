# Name: Eric Pereira
# problem 4.21

from scipy.stats import norm

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

