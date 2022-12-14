/*
    Author: Eric Pereira
    Date: 28 Nov 2017
    Project: Assignment 5 Inheritance
*/

#include <iostream>
#include <string>
#include <cctype>
using namespace std;

//greatest common divisor problem below that is solved through recursion
int gcd(int num1, int num2) {
    return num2 == 0 ? num1 : gcd(num2, num1 % num2);
}

//this class represents a Number of some sort
class Number {
    protected:
        int a, b;
    public:

        ~Number() {}

        void setA(int num) {a = num;}
        void setB(int num) {b = num;}
        int getA(void) {return a;}
        int getB(void) {return b;}
        virtual string toString(void) = 0;
        virtual void print(void) = 0;
};

//this class represents a complex number, inherits from Number class
class Complex : public Number {
    public:

        //constructor below places values in real and imaginary variables
        Complex(int real, int imaginary) {
             a = real; 
             b = imaginary; 
        }

        ~Complex() {}

        //method below returns real number
        int getReal(void) {return a;}

        //method below returns imaginary number
        int getImaginary(void) {return b;}

        //method below changes real number
        void changeReal(int real) {a = real;}

        //method below changes imaginary number
        void changeImaginary(int imaginary) {b = imaginary;}

        //this operator is for the addition of complex numbers
        Complex operator+ (Complex num) {
            int newReal = (this->getReal() + num.getReal());
            int newImaginary = (this->getImaginary() + num.getImaginary());
            Complex newNumber(newReal, newImaginary);
            return newNumber;
        }

        //this operator is for multiplication of Complex Numbers
        Complex operator* (Complex num) {
            int newReal = ((this->getReal() * num.getReal()) + ((this->getImaginary() * num.getImaginary()) * -1));
            int newImaginary = ((this->getReal() * num.getImaginary()) + (this->getImaginary() * num.getReal()));
            Complex newNumber(newReal, newImaginary);
            return newNumber;
        }

        //this operator is for the subtraction of Complex Numbers
        Complex operator- (Complex num) {
            int newReal = (this->getReal() - num.getReal());
            int newImaginary = (this->getImaginary() - num.getImaginary());
            Complex newNumber(newReal, newImaginary);
            return newNumber;
        }

        //method below turns values into a complex string ready for output
        string toString() {

            //if statement below returns real - imaginary in the case that imaginary number is negative
            if (b < 0) {
                return to_string(a) + "-" + to_string(b*-1) + "i";
            } 
            
            //elif statement if complex variable is greater than 0 you add it
            else if (b > 0) {
                return to_string(a) + "+" + to_string(b) + "i";
            } 
            
            //elif statement if complex number is 0 print out only the real number
            else if (b == 0) {
                return to_string(a);

            //elif statment if real number is 0 print out only the complex number
            } else if (a == 0) {
                return to_string(b) + "i";
            }

            return "";
        }

        //prints complex value into output
        void print() {
            cout << this->toString() << endl;
        }
};

class Rational: public Number {
    public:

        //method below returns the value stored in the numerator
        int getNumerator(void) {return a;}

        //method below returns the value stored in the 
        int getDenominator(void) {return b;}

        //method below changes the value of the numerator
        void changeNumerator(int numerator) {a = numerator;}

        //method below changes the value of the denominator
        void changeDenominator(int denominator) {b = denominator;}

        //method below regulates fraction so that 
        void checkFraction (void) {

            //if statement checks if denominator is less than 0. ifso, multiply the num and den by -1
            if (this->getDenominator() < 0) {
                this->changeNumerator(getNumerator() * -1);
                this->changeDenominator(getDenominator() * -1);
            } 

            //ifel statement below returns something if 
            if (this->getDenominator() == 0 || this->getNumerator() == 0) {
                return;
            } else {
                int GCD = gcd(abs(this->getNumerator()), this->getDenominator());
                this->changeNumerator(this->getNumerator() / GCD);
                this->changeDenominator(this->getDenominator() / GCD);
            }
        }

        //constructor below places values in numerator and denominator variables
        Rational(int numerator, int denominator) {
            a = numerator; 
            b = denominator;
            this->checkFraction();
        }

        ~Rational() {}

        //operator change below  allows for addition of fractions
        Rational operator+(Rational num) {
            int newDenominator = (this->getDenominator() * num.getDenominator());
            int newNumerator = ((this->getNumerator() * num.getDenominator()) + (num.getNumerator() * this->getDenominator()));
            Rational newFraction(newNumerator, newDenominator);
            newFraction.checkFraction();
            return newFraction;
        }

        //operator change below allows for the multiplication of fractions
        Rational operator*(Rational num) {
            int newNumerator = this->getNumerator() * num.getNumerator();
            int newDenominator = this->getDenominator() * num.getDenominator();
            Rational finalNumber(newNumerator, newDenominator);
            finalNumber.checkFraction();
            return finalNumber;
        }

        //operator change below allows for the subtraction of fractions
        Rational operator-(Rational num) {
            int newDenominator = (this->getDenominator() * num.getDenominator());
            int newNumerator = ((this->getNumerator() * num.getDenominator()) - (num.getNumerator() * this->getDenominator()));
            Rational newFraction(newNumerator, newDenominator);
            newFraction.checkFraction();
            return newFraction;
        };

        //method below turn Rational into a proper string for output
        string toString(void) {

            //if the denominator is 0 then there is an error output
            if (this->getDenominator() == 0) {
                return "ERROR: Division by zero error.";
            } 
            
            //if the denominator is 1 or the numerator is 0 return just the numerator value
            else if (this->getDenominator() == 1 || this->getNumerator() == 0) {
                return to_string(a);
            }

            //if other clauses are not met with print standard numerator over denominator format
            else {
                return to_string(a) + "/" + to_string(b);
            }

            return "";
        }

        //method below prints output for Rational functions
        void print(void) {
            cout << this->toString() << endl;
        }   
};

//input different tests in the main to see what happens
int main(void) {
}
