import csv
import sys

#prints out an Error output if there is an error
def ErrorOutput(lineNum, Value, errorNum):

    if(Value == ""):
        return;

    print("Error in line  " + str(lineNum) + "   " + str(Value) + "  ", end="")

    #errorNum is put in and determines what type of error there was
    if (errorNum == 1):
        print("is not a valid age"); 
    elif (errorNum == 2):
        print("is not an integer");
    elif (errorNum == 3):
        print("is not a float");
    elif (errorNum == 4):
        print("is not a valid rating");

def isfloat(value):
  try:
    float(value)
    return True
  except ValueError:
    return False

with open("myMovieRatingsNew.csv", "w", newline="") as outcsvfile:
    writeCSV = csv.writer(outcsvfile);

    #reads in CSV, only allows for reading, dont want to manipulate this file
    with open("myMovieRatings.csv", "r") as csvfile:
        readCSV = csv.reader(csvfile, delimiter=",");



        lineNum = 0;
        broken = False;

        #below is the loop that reads through entire given CSV
        for row in readCSV:

            lineNum = lineNum + 1;
            broken = False;

            if(lineNum == 1):
                writeCSV.writerow(row);

            #ensures it is not the first row, or it will be read wrong
            elif(lineNum != 1):


                #loop allows to check for errors even with missing data
                for num in range (0,6):
                    
                    #if below checks for errors only with age and outputs such
                    if(num == 0):
                        if(not row[num].isdigit()):
                            ErrorOutput(lineNum, row[num], 2);
                            broken = True;
                        elif(int(row[num]) < 13 or int(row[num]) > 19):
                            ErrorOutput(lineNum, row[num], 1);
                            broken = True;
                    #elif below checks for errors with ratings (all, male, female), and outputs such
                    elif(num == 1 or num == 3 or num == 5):
                        if(not isfloat(row[num])):
                            ErrorOutput(lineNum, row[num], 3);
                            broken = True;
                        elif(float(row[num]) < 0 and float(row[num]) > 5):
                            ErrorOutput(lineNum, row[num], 4);
                            broken = True;
                    #elif below checks for errors with num of ratings (all, male, female), and outputs such
                    elif(num == 2 or num == 4 or num == 6):
                        #below if checks if numOfRatings is correct
                        if(not row[num].isdigit()):
                            ErrorOutput(num, row[num], 2);
                            broken = True;

            #if it is not broken the new file will have the line written to it
            if(not broken):
                writeCSV.writerow(row);

    




