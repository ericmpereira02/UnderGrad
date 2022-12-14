# Name: Eric Pereira
# normal python version of MonteCarlo

import random
import math

inCircle = 0

for item in range(100000):
    x = random.random()
    y = random.random()
    
    d = math.sqrt(x**2 + y**2)
    
    if d <= 1:
        inCircle += 1
    
pi = (inCircle / 100000) * 4

print(pi)

#output is: 3.13792