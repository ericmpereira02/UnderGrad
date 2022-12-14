/*
    Author: Eric Pereira
    Class: Programming in a Second Language
    Assignment: PA4 Template Class
    Date: 07 November 2017
*/

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string>
using namespace std;

//class below creates a node
template<class T>
class Node {

    //variables are set to private, only to be accessed by the node itself 
private: 
    T value;
    Node* nextNode;

    //all methods below are public, and called upon when access to variables is needed
public:
    T getValue() { return value; }
    void setValue(T val) { value = val;}
    void setNext(Node* next) { nextNode = next;}
    Node* getNext() { return nextNode; }

    //below sets values to num and next. like a constructor, but not
    void setVals (T val, Node* next) {
        value = val;
        nextNode = next;
    }
};

Node<string>* headString = new Node<string>;
Node<int>* headInt = new Node<int>;

string convertToUpper(string someString) {
    for(unsigned int ii = 0; ii < someString.length(); ii++) {
        if(someString[ii] >= 97 || someString[ii] <= 122) {
            char temp = someString[ii];
            someString[ii] = toupper(temp);
        }
    }
    return someString;
}

//in the case the user uses index 0
void insertFirstInt(int value) {
    Node<int> *newNode = new Node<int>;
    newNode->setVals(value, headInt->getNext());
    headInt->setNext(newNode);
}

void insertFirstString(string value) {
    Node<string> *newNode = new Node<string>;
    value = convertToUpper(value);
    cout << value << endl;
    newNode->setVals(value, headString->getNext());
    headString->setNext(newNode);
}

//places new node in end of the linked list
void insertEndInt(int value) {
    Node<int>* temp = headInt;
    while (temp) {
        if (temp->getNext() == nullptr) {
            Node<int> *newNode = new Node<int>;
            newNode->setVals(value, nullptr);
            temp->setNext(newNode);
            break;
        }
        temp = temp->getNext();
    }
}

//places new node in end of the linked list
void insertEndString(string value) {
    Node<string>* temp = headString;
    value = convertToUpper(value);
    while (temp) {
        if (temp->getNext() == nullptr) {
            Node<string> *newNode = new Node<string>;
            newNode->setVals(value, nullptr);
            temp->setNext(newNode);
            break;
        }
        temp = temp->getNext();
    }
}

//inserts a node at a specific point
void insertAtString(int index, string value) {
    Node<string>* curr = headString;
    Node<string>* prev = new Node<string>;
    int listNum = -1;
    value = convertToUpper(value);
    while (curr) {
        if (listNum == index) {
            Node<string> *newNode = new Node<string>;
            newNode->setVals(value, curr);
            prev->setNext(newNode);
            break;
        }
        prev = curr;
        curr = curr->getNext();
        listNum++;
    }
}

//inserts a node at a specific point
void insertAtInt(int index, int value) {
    Node<int>* curr = headInt;
    Node<int>* prev = new Node<int>;
    int listNum = -1;
    while (curr) {
        if (listNum == index) {
            Node<int> *newNode = new Node<int>;
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
void deleteLinkedListInt(Node<int> **node)
{
	Node<int> *tmpNode;
	while(*node) {
		tmpNode = *node;
        *node = tmpNode->getNext();
        tmpNode->setValue(0);
        tmpNode->setNext(nullptr);
		delete tmpNode;
	}
}

//to be used at the end of a program to delete an entire linked list
void deleteLinkedListString(Node<string> **node)
{
	Node<string> *tmpNode;
	while(*node) {
		tmpNode = *node;
        *node = tmpNode->getNext();
        tmpNode->setNext(nullptr);
		delete tmpNode;
	}
}

//below deletes a node at an index for strings
void deleteNodeInInt(int position) {
    Node<int> *curr = new Node<int>;
    Node<int> *prev = new Node<int>;
    curr = headInt;
    int listNum = -1;
    while (curr) {
        if (listNum == position) {
            prev->setNext(curr->getNext());
            curr->setNext(nullptr);
            curr->setValue(0);
            delete curr;
            break;
        }
        prev = curr;
        curr = curr->getNext();
        listNum++;
    }
}

//below deletes a node at an index
void deleteNodeInString(int position) {
    Node<string> *curr = new Node<string>;
    Node<string> *prev = new Node<string>;
    curr = headString;
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
bool deleteNodeValInt(int value) {
    Node<int> *curr = new Node<int>;
    Node<int> *prev = new Node<int>;
    curr = headInt;
    while(curr) {
        if (curr->getValue() == value) {
            prev->setNext(curr->getNext());
            curr->setNext(nullptr);
            curr->setValue(0);
            delete curr;
            return true;
        }
        prev = curr;
        curr = curr->getNext();
    }
    return false;
}

//below deletes a node if it contains a certain value
//returns bool to indicate whether item was deleted or not
bool deleteNodeValString(string value) {
    value = convertToUpper(value);
    Node<string> *curr = new Node<string>;
    Node<string> *prev = new Node<string>;
    curr = headString;
    while(curr) {
        if (curr->getValue() == value) {
            prev->setNext(curr->getNext());
            delete curr;
            return true;
        }
        prev = curr;
        curr = curr->getNext();
    }
    return false;
}

//listcontents below finds contents to be used in output
string listContentsString() {
    string contents = "List contents: ";
    Node<string>* temp = headString;
    while (temp) {
        if (temp->getValue() != "") {
            contents += temp->getValue() + " ";
        }
        temp = temp->getNext();
    }
    return contents;
}

//listcontents below finds contents to be used in output
string listContentsInt() {
    string contents = "List contents: ";
    Node<int>* temp = headInt;
    while (temp) {
        if (temp->getValue() != 0) {
            contents += to_string(temp->getValue()) + " ";
        }
        temp = temp->getNext();
    }
    return contents;
}

//time complexity of this algorithm is O(NM)
string commonValues (string var1, string var2) {
    
    unsigned int pos = 0;
    string temp = "";
    string LCS = "";
    
    for(unsigned int ii = 0; ii < var1.length(); ii++) {
        pos = ii;
        for(unsigned int jj = 0; jj < var2.length(); jj++) {
            if (var1[pos] == var2[jj] && pos <= var1.length()) {
                temp += var1[pos];
                pos++;
                if (temp.length() > LCS.length()) {LCS = temp;}
                if (pos == var1.length()) {break;}
            } else {
                temp = "";
                pos = ii;
            } 
        }
    }
    
    return LCS;
}

string findLCS(int listSize) {

    string LCS = "";
    Node<string>* temp = headString;
    if (listSize == -1) {
        return temp->getValue();
    } else if (listSize == 0) {
        return temp->getNext()->getValue();
    } else {
        temp = temp->getNext();
        LCS = commonValues(temp->getValue(), temp->getNext()->getValue());
        temp = temp->getNext()->getNext();
        while (temp) {
            // if (LCS == "") {
            //     break;
            // } else {
                LCS = commonValues(temp->getValue(), LCS);
            // }
            temp = temp->getNext();
        }
    }
    
    return LCS;
}

//greatest common divisor problem below that is solved through recursion
//time complexity is O(log(num1 + num2))
int gcd(int num1, int num2) {
    return num2 == 0 ? num1 : gcd(num2, num1 % num2);
}

//below finds a GCD in a linked list
int findGCD() {
    Node<int>* temp = headInt;
    int GCD = 0;
    int amount = 0;
    while (temp) {
        if (amount == 0) {
            GCD = temp->getValue();
            amount++;
        } else {
            GCD = gcd(GCD, temp->getValue());
        }
        temp=temp->getNext();
    }
    return GCD;
}

//output function outputs list GCD and contents
void outputInt() {
    int GCD = findGCD();
    cout << "List's Common Value: " << GCD << endl;
    cout << listContentsInt();
    cout << endl;
}

//output function outputs list GCD and contents
void outputString(int listSize) {
    string LCS = findLCS(listSize);
    cout << "List's Common Value: " << LCS << endl;
    cout << listContentsString();
    cout << endl;
}

int main() {
    string strVal = "";
    int intVal = 0;
    string dataType = "";
    cin >> dataType; 
    dataType = convertToUpper(dataType);
    if (dataType == "NUMBERS") {
        delete headString;
        headInt->setVals(0, nullptr);
    } else if (dataType == "STRINGS"){
        delete headInt;
        headString->setVals("", nullptr);
    } else {
        exit(0);
    }

    //all variables are initialized at start of main
    int inCode = 0;
    int index = 0;
    int listSize = -1;

    //do while is used so at least one input is in
    do { 

        cin >> inCode;
        //adds node at index i with value v
        if (inCode == 0) {
            break;
        }
        if (inCode == 1) {
            //input values of index and value are attained
            cin >> index;
            if (dataType == "NUMBERS") {
                cin >> intVal;
            } else {
                cin >> strVal;
            }

            //listSize is added whenever an item is added to list
            listSize++;
            
            //inserts after head if index is equal to 0
            if (index == 0) {
                if (dataType == "NUMBERS") {
                    insertFirstInt(intVal);
                } else {
                    insertFirstString(strVal);
                }
                

            // inserts at end if index is greater or equal to list size
            } else if (index >= listSize) {
                
                if (dataType == "NUMBERS") {
                    insertEndInt(intVal);
                } else {
                    insertEndString(strVal);
                }

            } else {
                
                if (dataType == "NUMBERS") {
                    insertAtInt(index, intVal);
                } else {
                    insertAtString(index, strVal);
                }
            }
        } 

        //removes node at index i
        else if (inCode == 2) {

            //only index in input
            cin >> index;

            //if index is greater or equal to list size do nothing
            if (index <= listSize) {
                
                if (dataType == "NUMBERS") {
                    deleteNodeInInt(index);
                } else {
                    deleteNodeInString(index);
                }

                //listsize is subracted, we lose an item
                listSize--;
            }
        } 

        //removes first encountered node with value v
        else if (inCode == 3) {

            if (dataType == "NUMBERS") {
                cin >> intVal;
            } else {
                cin >> strVal;
            }

            if (dataType == "NUMBERS") {
                if(deleteNodeValInt(intVal)){
                    listSize--;
                }
            } else {
                if(deleteNodeValString(strVal)) {
                    listSize--;
                }
            }
        }

        if (dataType == "NUMBERS") {
            //output is displayed
            outputInt();
        } else {
            //output is displayed
            outputString(listSize);
        }
    } while (inCode != 0);

    if (dataType == "NUMBERS") {
        //prevents memory leak, deletes entire linked list
        deleteLinkedListInt(&headInt);
    } else {
        //prevents memory leak, deletes entire linked list
        deleteLinkedListString(&headString);
    }
}