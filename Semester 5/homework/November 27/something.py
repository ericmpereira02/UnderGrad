import sys
import os
import csv
import math
import numpy as np
import matplotlib.pyplot as plt 

#assembles a list of days in month
weeksInMonth=[]
for num in range (1,32):
    weeksInMonth.append(num);

with open("pvdWxJan.csv", "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=",");

    firstOpen = True;

    #dewpoint is what pos dewpoing is in csv, I dont feel like counting in CSV
    dewpoint = 0;
    #dailyDewpointList is list of the daily dewpoints in the month of january
    dailyDewpointList = [];
    
    #wetbulb is what pos wetbulb temp is in csv, I dont feel like counting in CSV
    wetbulb = 0;
    #dailyWetbulbTemp is list of the daily wetbulb in the month of january
    dailyWetbulbTemp = [];

    #for loop below goes through CSV
    for row in readCSV:
        if(firstOpen):
            dewpoint = row.index("DAILYAverageDewPointTemp");
            wetbulb = row.index("DAILYAverageWetBulbTemp");
            firstOpen = False;
        elif(row[dewpoint] != ""):
            dailyDewpointList.append(int(math.floor(float(row[dewpoint]))));
            dailyWetbulbTemp.append(int(math.floor(float(row[wetbulb]))));

plt.title("Wetbulb Temperature and Dewpoint in January")
plt.plot(weeksInMonth, dailyDewpointList, "r", label="Dewpoint");
plt.plot(weeksInMonth, dailyWetbulbTemp, "b", label="Wetbulb");
plt.ylabel("Temperature");
plt.xlabel("Day in January");
plt.savefig('plot.png');
