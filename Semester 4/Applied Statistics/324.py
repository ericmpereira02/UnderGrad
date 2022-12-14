
# problem 3.24

from scipy.stats import binom

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