#include <iostream>
using namespace std;

int main(){
    int s = 0 ;
    int n = 100;
    for(int i = 0 ; i < n ; i++) { 
        for (int j = 0 ; j < i ; j++) {
            for ( int k = 0 ; k < j ; k++) { s+=1; }
        }
    }
    cout << s << endl;
    return 0;
} 