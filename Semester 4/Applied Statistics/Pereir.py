# Eric Pereira
# CSE2400
# Python Assignment 2
# 3/22/17

import math

def summary(alist):
    
    #sorts the list from least to greatest
    alist.sort();

    #prints out the list for user to see
    print("The list is:");
    print(alist);

    #prints out maximum value
    print("The max value of the list is: " + str(max(alist)));

    #prints out the minimum value
    print("The min value of the list is: " + str(min(alist)));

    #prints out the mean of a list
    print("The mean value of the list is: " + str(sum(alist)/len(alist)));

    #prints out the median of a list
    print("The median value of the list is: " + str(getMedian(alist)));

    #prints out the range of a list
    print("The range value of the list is: " + str(max(alist) - min(alist)));

    #prints out the mode of a list
    print("The mode value(s) of the list is(are): " + str(getMode(alist)));

    #prints out the standard deviation of a list
    print("The standard deviation of the list is: " + str(getStandardDeviation(alist, (sum(alist)/len(alist)))));
    #below gets all the items with their frequencies
    print("Frequency table is as follows:")
    frequencyTable(alist);



#function below finds the number(s) in a list with the highest frequency
def getMode(alist):
    countDict = {};
    for item in alist:
        if item in countDict:
            countDict[item] = countDict[item] + 1;
        else:
            countDict[item] = 1;
    
    countList = countDict.values();
    maxCount = max(countList);

    modeList = [ ];
    for item in countDict:
        if countDict[item] == maxCount:
            modeList.append(item);
        
    return modeList;

#function below prints out the frequency table
def frequencyTable(alist):
    countDict = {};

    for item in alist:
        if item in countDict:
            countDict[item] = countDict[item]+1;
        else:
            countDict[item] = 1;
        
    itemList = list(countDict.keys());
    itemList.sort();

    print ("ITEM","FREQUENCY");
    for item in itemList:
        print(item, "     ", countDict[item]);

#below function finds the standard deviation
def getStandardDeviation(alist, mean):
    if len(alist) <= 1:
        return 0;
    
    total = 0;
    for item in alist:
        total += ((item - mean) ** 2);

    total /= len(alist) - 1;
    return math.sqrt(total);

#function finds the median of a list
def getMedian(alist):
    copyList = alist[:];
    copyList.sort();
    #if below is for even numbers
    if len(copyList)%2 == 0:
        rightmid = len(copyList) // 2;
        leftmid = rightmid - 1;
        median = ((copyList[leftmid] + copyList[rightmid]) / 2);
    #else statement below is for odd numbers
    else:
        median = copyList[len(copyList) // 2]
    return median

#below are test instances mentioned in the assingment
print("First Test:");
alist = [3, 3, 3, 3, 3, 3, 3, 3, 3, 3];
summary(alist);
print();

print("Second Test:");
alist = [17];
summary(alist);
print();

print("Third Test:");
alist = [4, 6, 5, 7, 8, 1, 9, 2, 50000];
summary(alist);
print()

print("Problem 8.2 from Baron Textbook:");
alist = [17.2, 22.1, 18.5, 17.2, 18.6, 14.8, 21.7, 15.8, 16.3, 22.8, 24.1, 13.3, 16.2, 17.5, 19.0, 23.9, 14.8, 22.2, 21.7, 20.7, 13.5, 15.8, 13.1, 16.1, 21.9, 23.9, 19.3, 12.0, 19.9, 19.4, 15.4, 16.7, 19.5, 16.2, 16.9, 17.1, 20.2, 13.4, 19.8, 17.7, 19.7, 18.7, 17.6, 15.9, 15.2, 17.1, 15.0, 18.8, 21.6, 11.9];
summary(alist);
print();

print("Problem 8.8 part 1 from Baron Textbook:");
alist = [19, 24, 12, 19, 18, 24, 8, 5, 9, 20, 13, 11, 1, 12, 11, 10, 22, 21, 7, 16, 15, 15, 26, 16, 1, 13, 21, 21, 20, 19];
summary(alist);
print();

print("Problem 8.8 part 2 from Baron Textbook:");
alist = [17, 24, 21, 22, 26, 22, 19, 21, 23, 11, 19, 14, 23, 25, 26, 15, 17, 26, 21, 18, 19, 21, 24, 18, 16, 20, 21, 20, 23, 33];
summary(alist);
print();

print("Problem 8.8 part 3 from Baron Textbook");
alist = [56, 52, 13, 34, 33, 18, 44, 41, 48, 75, 24, 19, 35, 27, 46, 62, 71, 24, 66, 94, 40, 18, 15, 39, 53, 23, 41, 78, 15, 35];
summary(alist);
print();