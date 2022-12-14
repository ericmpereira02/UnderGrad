import csv
import sys
import math

#reads in a csv file for python, start of question 1
count = 0; 
with open("pvdFlights.csv", "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=",");

    #loop goes through all rows in CSV
    for row in readCSV:
        #at row[6] is the origin and part[7] is destination
        if(row[6] == "PVD" and row[7] == "FLL"):
            #increments count
            count+=1;

#print below answers question 1
print("\nIn January, " + str(count) + " flights operated from PVD to FLL");








#print below gets destination for question 1a
destination = str(input("Please supply a destination airport: "));
destination=destination.upper();
#resets count and opens file again
count = 0; 
with open("pvdFlights.csv", "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=",");

    #loop goes through all rows in CSV
    for row in readCSV:
        #at row[7] is destination, row[11] checks cancelled flights
        if(row[7] == destination and row[11] != "1"):
            #increments count
            count+=1;

#answers question 1a
print("In January " + str(count) + " flights went to " + str(destination) + "\n");







#start of question 2
count = 0;
totalDelay = 0;
with open("pvdFlights.csv", "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=",");

    for row in readCSV:
        #row 7 is destination, row[6] is the origin, and it checks if the flight was delayed, row[11] is cancelled
        if (row[6] == "PVD" and row[7] == destination and row[12] != "1" and row[11] != ""):
            
            if(int(math.floor(float(row[11]))) >= 0):
                #increments count
                count += 1;
                #row 11 is the arrival delay
                totalDelay += int(math.floor(float(row[11])));
        

#answer to question 2
print("The average arrival delay of flights from PVD to" + destination + " was " + str(int(math.floor(round((totalDelay/count), 0)))) + " minutes");








#start of question 2a
airline = input("Please supply an airline: ");
airline=airline.upper();
count = 0;
with open("pvdFlights.csv", "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=",");

    for row in readCSV:
        #row 7 is destination, row[3] is the airline, and row[12] checks if cancelled
        if (row[3] == airline and row[6] == "PVD" and row[7] == destination and row[12] != "1"):
            #increments count
            count += 1;

#answer to question 2a
print("the airline " + str(airline) + " went from PVD to " + str(destination) + " a total of " + str(count) + " times in January\n");








#start question 3
delayCount = 0;
count = 0;

with open("pvdFlights.csv", "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=",");

    for row in readCSV:
        #row 7 is destination, row[12] is the cancelled tab
        if (row[6] == "PVD" and row[7] == destination and row[12] != "1" and row[11] != ""):
            #increments cont
            count += 1;
            if(int(math.floor(float(row[11]))) >= 0):
                #increments delaycount
                delayCount+=1;

#answer to question 3
print("Out of the " + str(count) + " flights from PVD to " + str(destination) + ", " + str(delayCount) + " were delayed");








#start question 3a
delayCount = 0;
count = 0;
with open("pvdFlights.csv", "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=",");

    for row in readCSV:
        #row 7 is destination, row[12] is the cancelled tab
        if (row[6] == "PVD" and row[7] == destination and row[12] != "1" and row[11] != ""):
            #increments count
            count += 1;
            if(int(math.floor(float(row[11]))) > 5):
                #increments delaycount
                delayCount+=1;

#below prints result of question 3a          
print("Out of the " + str(count) + " flights from PVD to " + str(destination) + ", " + str(delayCount) + " were delayed (at least by more than 5 mins)");








#start question 3b
cancelCount = 0.0;
count = 0.0;

with open("pvdFlights.csv", "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=",");

    for row in readCSV:
        #row 7 is destination, row[11] is the cancelled tab
        if (row[6] == "PVD" and row[7] == destination and row[3] == airline):
            #increments count
            count += 1;
            if(int(math.floor(float(row[12]))) == 1):
                #increments cancelcount
                cancelCount+=1;

#answers question 3b
print(str(round((cancelCount/count)*100, 2)) + "% of the flights were cancelled\n");








#Final question, gathers lots of information for the user and then opens file and checks all data
destination=str(input("Where are you going? "));
airline=str(input("What airline are you taking? "));

destination=destination.upper();
airline=airline.upper();
totalDelay = 0;
delayCount = 0;
cancelCount = 0.0;
count = 0.0;

with open("pvdFlights.csv", "r") as csvfile:
    readCSV = csv.reader(csvfile, delimiter=",");

    for row in readCSV:
        #row 7 is destination, row[11] is the cancelled tab
        if (row[6] == "PVD" and row[7] == destination and row[3] == airline):
            #increments count
            count += 1;
            if(int(math.floor(float(row[12]))) == 1):
                #increments cancelcount
                cancelCount+=1;
            elif(row[11] != ""):
                if(int(math.floor(float(row[11]))) > 5):
                    totalDelay+=float(row[11]);
                    delayCount+=1;

#all final output, separated into multiple print statements for ease of use and access
print();
print(airline + " was supposed to operate " + str(int(math.floor(count))) + " flights from PVD to " + destination + ". ", end="");
print(str(int(math.floor(cancelCount))) + " of those (" + str(round(cancelCount/count*100.0, 2)) + "%) were cancelled. ", end="");
print(str(delayCount) + " (" + str(round(delayCount/count*100.0 , 2)) + "%) were delayed by more than 5 minutes. ", end="");
print("The average delay was " + str(math.floor(round(totalDelay/delayCount, 0))) + " minutes.\n");