/*
    Author: Eric Pereira
    Course: CSE2050
    Assignment: Dynamic Memory
*/

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string>
using namespace std;

//struct below creates a node, aand the node 
struct Node {
    //variables are set to private, only to be accessed by the node itself 
private: 
    int number;
    Node* nextNode;

    //all methods below are public, and called upon when access to variables is needed
public:
    int getNumber() { return number; }
    void setNumber(int num) { number = num;}
    void setNext(Node* next) { nextNode = next;}
    Node* getNext() { return nextNode; }
};

//this initNode is specifically used for the creation of the head. 
void initNode(Node *head, int num) {
    head->setNumber(num);
    head->setNext(nullptr);
}

//places new node in front of the linked list
void insertFront(struct Node **head, int num) {
    Node *newNode = new Node;
    newNode->setNumber(num);
    newNode->setNext(*head);
    *head = newNode;
}

//greatest common divisor problem below that is solved through recursion
//time complexity is O(log(num1 + num2))
int gcd(int num1, int num2) {
    return num2 == 0 ? num1 : gcd(num2, num1 % num2);
}

//complexity of the linked list in this step is O(n^2)
string output(struct Node *head) {
    Node *list = head;

    //initialize variables to 0 before going through the loop and multiplying
    int amount = 0;
    long product = 0;
    int GCD = 0;
    int lcm = 0;
    string numbersList = "";

    //loops through the entire list to find GCD, Product, and total numbes
	while(list) {
        
        //if clause is necessary for first run through
        if (amount == 0) {

            //product, GCD, and lcm are set equal to the first num then used later
            product = list->getNumber();
            GCD = list->getNumber();
            lcm = list->getNumber();

        } else {

            //product is multiplied with the previous num and set in product
            product *= list->getNumber();

            //GCD is calculated by curr GCD and then next num in list
            GCD = gcd(GCD, list->getNumber());

            //lcm uses its curr value, multiplied by next num, over lcd of lcm and next num
            lcm = (lcm * list->getNumber()) / gcd(lcm, list->getNumber());
        }
        
        //done in every case, amount gets added +1 with every run and list is set to next object
        amount++;
        list = list->getNext();
    }

    
    //list is reinitialized to head, has to go through loop againt to find values/GCD
    list = head;
    while (list) {
        
        //the number stored in the Node gets changed to the number over the GCD
        list->setNumber(list->getNumber() / GCD);

        //string gets value of number in list/GCD for 
        numbersList += (to_string((list->getNumber())) + " ");

        //goes to the next node 
        list = list->getNext();
    }

    //final string is returned. 
	return to_string(amount) + " " + to_string(product) + " " + to_string(GCD) + " " + to_string(lcm) + "\n" + numbersList;
}



int main(int argc, char *argv[]) {
    
    //initial declaration of the head node
    Node *head = new Node;

    //stores the value in the head with the first number value from user input
    initNode(head, atoi(argv[1]));

    //loop below puts all remaining values in user input in the list
    for (int ii = 2; ii < argc; ii++) {
        insertFront(&head,atoi(argv[ii]));
    }

    //calls the output string
    cout << output(head) << endl;
}



    }