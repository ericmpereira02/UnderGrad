
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main() {

    int itterate = 507;
    ofstream output;
    output.open("input.txt");

    output << "507\n507\n";

    for(int ii = 0; ii < itterate; ii++) {
        output << "507\n";
    }

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