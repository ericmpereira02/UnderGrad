# Name: Eric Pereira
# problem 3.33

from scipy.stats import poisson
from scipy.stats import binom

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