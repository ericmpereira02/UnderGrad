#include <stdio.h>
#include <stdbool.h>
#include <fstream>
#include <iostream>
using namespace std;



int test(int count) {
    count++;
    return count;
}

// void algRun() {
//     while (count != 0) {
//         safe = false;
//         for (i = 0; i < p; i++) {
//             if (running[i]) {
//                 exec = 1;
//                 for (j = 0; j < r; j++) {
//                     if (max_claim[i][j] - curr[i][j] > avl[j]) {
//                         exec = 0;
//                         break;
//                     }
//                 }
 
//                 if (exec) {
//                     printf("\nProcess%d is executing.\n", i + 1);
//                     running[i] = 0;
//                     count--;
//                     safe = true;
//                     for (j = 0; j < r; j++)
//                         avl[j] += curr[i][j];
//                     break;
//                 }
//             }
//         }
 
//         if (!safe) {
//             printf("\nThe processes are in unsafe state.");
//             break;
//         }
 
//         if (safe)
//             printf("\nThe process is in safe state.");
 
//         printf("\nAvailable vector: ");
//         for (i = 0; i < r; i++)
//             printf("%d ", avl[i]);
//     }
// }


void run () {

    string stuff;
    ifstream input;
    input.open("input.txt");

    int i, j, exec, r, p;
    int count = 0;
    bool safe = false;

    getline(input, stuff);
    r = stoi(stuff);
    getline(input, stuff);
    p = stoi(stuff);

    int running[p];
    int max_res[r];
    int max_claim[p][r];
    int curr[p][r];
    int alloc[r];
    int avl[r];

    //sets alloc
    for (int ii = 0; ii < r; ii++) {
        alloc[ii] = 0;
    }
 

    //gets count, creates claim table
    for (i = 0; i < p; i++) {
        running[i] = 1;
        getline(input, stuff);
        max_res[i] = stoi(stuff);
        count++;
        stuff = "";
    }

    
    //makes allocated resource table
    for (i = 0; i < p; i++) {
        for (j = 0; j < r; j++) {
            getline(input, stuff);
            curr[i][j] = stoi(stuff);
        }
 
    }



    //makes maximum claim table
    for (i = 0; i < p; i++) {
        for (j = 0; j < r; j++) {
            getline(input, stuff);
            max_claim[i][j] = stoi(stuff);
        }
    }
 


    // printf("\nThe Claim Vector is: ");
    // for (i = 0; i < r; i++)
    //     printf("%d ", max_res[i]);
 

    // printf("\nThe Allocated Resource Table:\n");
    // for (i = 0; i < p; i++) {
    //     for (j = 0; j < r; j++)
    //         printf("\t%d", curr[i][j]);
    //     printf("\n");
    // }
 
    // printf("\nThe Maximum Claim Table:\n");
    // for (i = 0; i < p; i++) {
    //     for (j = 0; j < r; j++)
    //         printf("\t%d", max_claim[i][j]);
    //     printf("\n");
    // }
 
    for (i = 0; i < p; i++)
        for (j = 0; j < r; j++)
            alloc[j] += curr[i][j];
 
    printf("\nAllocated resources: ");
    for (i = 0; i < r; i++)
        printf("%d ", alloc[i]);
    for (i = 0; i < r; i++)
        avl[i] = max_res[i] - alloc[i];
 
    printf("\nAvailable resources: ");
    for (i = 0; i < r; i++)
        printf("%d ", avl[i]);
    printf("\n");
    
    int testNum = 0;

    while (count != 0) {
        safe = false;
        for (i = 0; i < p; i++) {
            if (running[i]) {
                exec = 1;
                for (j = 0; j < r; j++) {
                    testNum = test(testNum);
                    if (max_claim[i][j] - curr[i][j] > avl[j]) {
                        exec = 0;
                        break;
                    }
                }
 
                if (exec) {
                    printf("\nProcess%d is executing.\n", i + 1);
                    running[i] = 0;
                    count--;
                    safe = true;
                    for (j = 0; j < r; j++)
                        avl[j] += curr[i][j];
                    break;
                }
            }
        }
 
        if (!safe) {
            printf("\nThe processes are in unsafe state.");
            break;
        }
 
        if (safe)
            printf("\nThe process is in safe state.");
 
        printf("\nAvailable vector: ");
        for (i = 0; i < r; i++)
            printf("%d ", avl[i]);
    }
    cout << endl;
    cout << "times run through test is: " << testNum << endl;
    input.close();
}


int main() {
    run();    
}