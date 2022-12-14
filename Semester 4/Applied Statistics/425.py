# Name: Eric Pereira
# problem 4.25

from scipy.stats import norm
from scipy.stats import binom

print("These are the answers to all 4.24")

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

