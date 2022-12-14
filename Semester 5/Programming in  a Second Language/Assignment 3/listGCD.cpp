/*
    Author: Eric Pereira
    Course: CSE2050
    Assignment: Linked List Manipulation
*/

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string>
using namespace std;

//class below creates a node
class Node {

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

    //below sets values to num and next. like a constructor, but not
    void setVals (int num, Node* next) {
        number = num;
        nextNode = next;
    }
};

//head is declared here to be used as a global
Node* head = new Node;

//in the case the user uses index 0
void insertFirst(int num) {
    Node *newNode = new Node;
    newNode->setVals(num, head->getNext());
    head->setNext(newNode);
}

//places new node in end of the linked list
void insertEnd(int num) {
    Node* temp = head;
    while (temp) {
        if (temp->getNext() == nullptr) {
            Node *newNode = new Node;
            newNode->setVals(num, nullptr);
            temp->setNext(newNode);
            break;
        }
        temp = temp->getNext();
    }
}

//inserts a node at a specific point
void insertAt(int index, int value) {
    Node* curr = head;
    Node* prev = new Node;
    int listNum = -1;
    while (curr) {
        if (listNum == index) {
            Node *newNode = new Node;
            newNode->setVals(value, curr);
            prev->setNext(newNode);
            break;
        }
        prev = curr;
        curr = curr->getNext();
        listNum++;
    }
}

//to be used at the end of a program to delete an entire linked list
void deleteLinkedList(Node **node)
{
	Node *tmpNode;
	while(*node) {
		tmpNode = *node;
		*node = tmpNode->getNext();
		delete tmpNode;
	}
}

//below deletes a node at an index
void deleteNodeIn(int position) {
    Node *curr = new Node;
    Node *prev = new Node;
    curr = head;
    int listNum = -1;
    while (curr) {
        if (listNum == position) {
            prev->setNext(curr->getNext());
            delete curr;
            break;
        }
        prev = curr;
        curr = curr->getNext();
        listNum++;
    }
}

//below deletes a node if it contains a certain value
//returns bool to indicate whether item was deleted or not
bool deleteNodeVal(int value) {
    Node *curr = new Node;
    Node *prev = new Node;
    curr = head;
    while(curr) {
        if (curr->getNumber() == value) {
            prev->setNext(curr->getNext());
            delete curr;
            return true;
        }
        prev = curr;
        curr = curr->getNext();
    }
    return false;
}

//greatest common divisor problem below that is solved through recursion
//time complexity is O(log(num1 + num2))
int gcd(int num1, int num2) {
    return num2 == 0 ? num1 : gcd(num2, num1 % num2);
}

//below finds a GCD in a linked list
int findGCD() {
    Node* temp = head;
    int GCD = 0;
    int amount = 0;
    while (temp) {
        if (amount == 0) {
            GCD = temp->getNumber();
            amount++;
        } else {
            GCD = gcd(GCD, temp->getNumber());
        }
        temp=temp->getNext();
    }
    return GCD;
}

//listcontents below finds contents to be used in output
string listContents () {
    string contents = "List contents: ";
    Node* temp = head;
    while (temp) {
        if (temp->getNumber() != 0) {
            contents += to_string(temp->getNumber()) + " ";
        }
        temp = temp->getNext();
    }
    return contents;
}


//output function outputs list GCD and contents
void output() {
    int GCD = findGCD();
    cout << "List GCD: " << GCD << endl;
    cout << listContents();
    cout << endl;
}

int main() {
    //global head is initialized in main
    head->setVals(0, nullptr);
    
    //all variables are initialized at start of main
    int inCode = 0;
    int index = 0;
    int value = 0;
    int listSize = -1;

    //do while is used so at least one input is in
    do { 
        cin >> inCode;

        //adds node at index i with value v
        if (inCode == 1) {
            
            //input values of index and value are attained
            cin >> index;
            cin >> value;

            //listSize is added whenever an item is added to list
            listSize++;
            
            //inserts after head if index is equal to 0
            if (index == 0) {
                insertFirst(value);

            // inserts at end if index is greater or equal to list size
            } else if (index >= listSize) {
                insertEnd(value);
            } else {
                insertAt(index, value);
            }
        } 

        //removes node at index i
        else if (inCode == 2) {

            //only index in input
            cin >> index;

            //if index is greater or equal to list size do nothing
            if (index <= listSize) {
                deleteNodeIn(index);

                //listsize is subracted, we lose an item
                listSize--;
            }
        } 

        //removes first encountered node with value v
        else if (inCode == 3) {

            //only value is input
            cin >> value;

            //if value returns true item was removed from list
            if(deleteNodeVal(value)) {
                listSize--;
            }
        }

        //output is displayed
        output();
    } while (inCode != 0);

    //prevents memory leak, deletes entire linked list
    deleteLinkedList(&head);
}