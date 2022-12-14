/*
Author: Eric Pereira
Course: CSE2050
Assignment: Rational Numbers
*/

#include <iostream>
#include <string>
#include <cstdlib>
#include <sstream>
#include <cctype>
#include <algorithm>
using namespace std;


//function below turns two integer values into a string and returns what would look like a fraction
string rational_to_string(int n, int d) {

    //if the numerator and denominator are negative the whole thing is postive, so both become positive
    if (d < 0 && n < 0) {
        d = abs(d);
        n = abs(n);
    }

    /*if statment below checks if denominator is negative, if it is then numerator will 
    be switched to negative and denominator positive so it looks good in print*/
    if (d < 0) {
        n -= (2*n);
        d = abs(d);
    }

    //if statement below checks if divisor is 1, ifso it sets return to just numerator
    if (d == 1) {
        return to_string(n);
    }

    //answer below concatenates (numerator + / + denominator) into string
    string answer = to_string(n) + "/" + to_string(d);
    return answer;
}

//greatest common divisor problem below that is solved through recursion
int gcd(int num1, int num2) {
    return num2 == 0 ? num1 : gcd(num2, num1 % num2);
}

//function below will do addition of fractions
string rational_addition(int n1, int d1, int n2, int d2) {
    //below is the multiplication of both denominators
    int den = d1 * d2;

    //numerators are created based on denominator multiplication 
    int num1 = n1 * d2;
    int num2 = n2 * d1;

    //below numerators are added
    num1 += num2;

    //GCD is calculated from function
    int GCD = gcd(num1, den);
    num1 /= GCD;
    den /= GCD;

    return rational_to_string(num1, den);
}

//function below will do subtraction of fractions
string rational_subtraction(int n1, int d1, int n2, int d2) {

    //below is the multiplication of both denominators
    int den = d1 * d2;

    //numerators are created based on denominator multiplication 
    int num1 = n1 * d2;
    int num2 = n2 * d1;
    num1 -= num2;
    int GCD = gcd(num1, den);
    num1 /= GCD;
    den /= GCD;
 
    return rational_to_string(num1, den);
}

//function below will do multiplication of fractions
string rational_multiplication(int n1, int d1, int n2, int d2) {

    //multiply numerator by other numerator and store it in already set n1
    n1 *= n2;

    //multiply denominator by other denominator and store it in already set d1
    d1 *= d2;

    //checks to see if there is any GCD 
    int GCD = gcd(n1, d1);
    n1 /= GCD;
    d1 /= GCD;

    return rational_to_string(n1, d1);
}

//function below will do division of fractions
string rational_division(int n1, int d1, int n2, int d2) {
    
    //multiply numerator by demoniator to do division (this is an easy way to divide)
    n1 *= d2;

    //do same but with the second numerator
    n2 *= d1;

    //checks to see if there is any GCD
    int GCD = gcd(n1, n2);
    n1 /= GCD;
    n2 /= GCD;
    return rational_to_string(n1, n2);
}

int main(int argc, char *argv[])
{
    //integers below are set accordingly to intended position in input
    int n1 = atoi(argv[1]), d1 = atoi(argv[2]), n2 = atoi(argv[3]), d2 = atoi(argv[4]), opcode = atoi(argv[5]);

    //switch statement sets opcode accordingly based on case, if it is not in the range 1 <= opcode <= 4 error will occur
    switch(opcode){
        case 1:
            cout << rational_addition(n1, d1, n2, d2) << endl;
            break;
        case 2:
            cout << rational_subtraction(n1, d1, n2, d2) << endl;
            break;
        case 3:
            cout << rational_multiplication(n1, d1, n2, d2) << endl;
            break;
        case 4:
            cout << rational_division(n1, d1, n2, d2) << endl;
            break;
        default:
            cout << "Opcode is not within boundries 1 <= Opcode <= 4." << endl;
    }
}