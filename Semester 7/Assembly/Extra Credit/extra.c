#include <stdio.h>

void HelloWorld (void) asm ("HelloCSE3120");
void goodBye (void);

int foo asm ("myfoo") = 2;
int potato asm ("papas");
int bar = 12;

//example of how this can get confusing
int foo_in_asm asm ("foo") = 35;

//example of something that would not be allowed
//int bar_fail asm ("bar");

Rectangle someRectangle = {3, 6};

int main (void) {

    //int warning asm ("IsThisNotStaticSoIWillGetAnError");

    printf("some")
    //calls funciton using controlled name
    asm("call HelloCSE3120");

    //shows change in value using controlled name
    printf("the value in foo before asm edit of myfoo is: %d \n", foo);
    asm("movl $23, myfoo");
    printf("the value in foo after asm edit of myfoo is: %d \n", foo);

    //shows change in value using normal name
    printf("the value in bar before asm edit is: %d \n", bar);
    asm("movl $25, bar");
    printf("the value in bar after asm edit is %d \n", bar);

    //calls function using uncontrolled name
    asm("call goodBye");
    return 0;
}

//says hello world
void HelloWorld (void){
    printf("Hello CSE3120!\n");
}

//says goodbye to the cruel world 
void goodBye (void) {
    printf("Goodbye CSE3120!\n");
}