# Eric Pereira
# CSE2400
# Homework 4
# 3 April 2017

import math;
import numpy as np;
import matplotlib.pyplot as plt;

def summary(alist):
    
    #sorts the list from least to greatest
    alist.sort();

    quartiles = getQuartiles(alist);
    #prints out the list for user to see
    print("The list is: " + str(alist));

    #prints out the minimum value
    print("The min value of the list is: " + str(min(alist)));

    #prints out the first quartile
    print("The value of the first quartile is: " + str(quartiles[0]));

    #prints out the median value
    print("The value of the median is: " + str(getMedian(alist)));

    #prints out the third quartile value
    print("The value of the third quartile value is: " + str(quartiles[1]));

    #prints out maximum value
    print("The max value of the list is: " + str(max(alist)));


#function below finds the mean of the list
def getMean(alist):
    return sum(alist)/len(alist);

def getQuartiles(alist):

    alist.sort();
    # check the input is not empty
    if not alist:
        raise StatsError('no data points passed')
        # 1. order the data set

    # 2. divide the data set in two halves
    mid = len(alist) // 2;

    if (len(alist) % 2 == 0):
        # even
        lowerQ = getMedian(alist[:mid])
        upperQ = getMedian(alist[mid:])
    else:
        # odd
        lowerQ = getMedian(alist[:mid])  # same as even
        upperQ = getMedian(alist[mid+1:])

    return (lowerQ, upperQ);

#function finds the median of a list
def getMedian(alist):

    alist.sort();
    #if below is for even numbers
    if len(alist) % 2 == 0:
        rightmid = len(alist) // 2;
        leftmid = rightmid - 1;
        median = ((alist[leftmid] + alist[rightmid]) / 2);

    #else statement below is for odd numbers
    else:
        median = alist[len(alist) // 2];

    return median

#Below are the lists for 8.8 parts 1, 2, and 3
list881 = [19, 24, 12, 19, 18, 24, 8, 5, 9, 20, 13, 11, 1, 12, 11, 10, 22, 21, 7, 16, 15, 15, 26, 16, 1, 13, 21, 21, 20, 19];
list882 = [17, 24, 21, 22, 26, 22, 19, 21, 23, 11, 19, 14, 23, 25, 26, 15, 17, 26, 21, 18, 19, 21, 24, 18, 16, 20, 21, 20, 23, 33];
list883 = [56, 52, 13, 34, 33, 18, 44, 41, 48, 75, 24, 19, 35, 27, 46, 62, 71, 24, 66, 94, 40, 18, 15, 39, 53, 23, 41, 78, 15, 35];

print("The mean of 881 is: " + str(sum(list881)/len(list881)) + " The median is: " + str(getMedian(881)));
print("The mean of 882 is: " + str(getMean(882)) + " The median is: " + str(getMedian(882)));
print("The mean of 883 is: " + str(getMean(883)) + " The median is: " + str(getMedian(883)));


#below is the summary part of problem 8.1 part b, first 2 weeks
print("The two five-point summaries and box plot are for problem 8.1:");
print("This is the first 14 days in problem 8.1:");
list81Initial = [56, 47, 49, 37, 38, 60, 50, 43, 43, 59, 50, 56, 54, 58];
summary(list81Initial);
print();

#below is the summary part of problem 8.1 part b, 20 days
print("This is the next 20 days in problem 8.1");
list81Final = [53,21,32,49,45,38,44,33,32,43,53,46,36,48,39,35,37,36,39,45];
summary(list81Final);
print();

# to explain, as asked in problem 8.1 c
# Looking at the boxplot of the first 14 days compared to the next 20 shows a lot
# in the first 14 days the values are significantly higher, according to the median and standard deviation.
# the next 20 days do not have such a trend, and most of the values are much lower, with one outliar.

#this displays the boxplot for 8.1
plt.boxplot([list81Initial, list81Final], labels=["First 14 Days", "Next 20 Days"]);
plt.show();
plt.clf();


#Below displays the summary for the list in problem 8.2, this answers 8.2c
print("The five-point summary, interquartile range, boxplot and histogram are for problem 8.2");
list82 = [17.2, 22.1, 18.5, 17.2, 18.6, 14.8, 21.7, 15.8, 16.3, 22.8, 24.1, 13.3, 16.2, 17.5, 19.0, 23.9, 14.8, 22.2, 21.7, 20.7, 13.5, 15.8, 13.1, 16.1, 21.9, 23.9, 19.3, 12.0, 19.9, 19.4, 15.4, 16.7, 19.5, 16.2, 16.9, 17.1, 20.2, 13.4, 19.8, 17.7, 19.7, 18.7, 17.6, 15.9, 15.2, 17.1, 15.0, 18.8, 21.6, 11.9];
summary(list82);

#Below gets the Quartiles for the list in problem 8.2 and finds the quartile range, answers 8.2d
list82Quartiles = getQuartiles(list82);
print("The value for the interquartile range of the list is: " + str(list82Quartiles[1] - list82Quartiles[0]));
print();

#Below is the boxplot for the list in problem 8.2
plt.boxplot([list82], labels=["concurrent users"]);
plt.show();
plt.clf();

#Below is the histogram for the list in problem 8.2 
plt.hist(list82);
plt.show();
plt.clf();

#Below shows the plot for the time to population list in problem 8.5
print("A plot will be outputted for all of 8.5: ")
list85 = [(1790, 3.9), (1800, 5.3), (1810, 7.2), (1820, 9.6), (1830, 12.9), (1840, 17.1), (1850, 23.2), (1860, 31.4), (1870, 38.6), (1880, 50.2), (1890, 63.0), (1900, 76.2), (1910, 92.2), (1920, 106.0), (1930, 123.2), (1940, 132.2), (1950, 151.3), (1960, 179.3), (1970, 203.3), (1980, 226.5), (1990, 248.7), (2000, 281.4), (2010, 308.7)];
plt.plot(*zip(*list85));
plt.show();
plt.clf();
print();

print("Plots displayed are for problems 8.8");

#Below prints the histograms for all lists in part 8.8
plt.hist(list881);
plt.show();
plt.clf();

plt.hist(list882);
plt.show();
plt.clf();

plt.hist(list883);
plt.show();
plt.clf();