
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main() {

    int itterate = 507;
    ofstream output;
    output.open("input.txt");

    //below outputs values for n and m
    output << "507\n507\n";

    //below outputs value for claim vector
    for(int ii = 0; ii < itterate; ii++) {
        output << "507\n";
    }

    //below outputs value 
    for(int ii = 0; ii < itterate; ii++) {
        int num = 1;
        for (int jj = 0; jj < itterate; jj++) {
            output << "1\n";
        }
    }

    for(int ii = 0; ii < itterate; ii++) {
        int num = 507 - ii;
        for (int jj = 0; jj < itterate; jj++) {
            output << to_string(num) + "\n";
        }
    }

    output.close();
    return 0;
}