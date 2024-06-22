#include <stdio.h>
#include <string.h>
#include <iostream>
using namespace std;

int main(){
    char helloWorld[] = "This is a c program running on linux - happy days";
    printf("%s", helloWorld);
    char emptySpace[] = "           ..........          ";
    printf("%s", emptySpace);
    
    int a = 100;
    int b = 200;
    int c = a + b;

    char output[] = "This is a c program running on linux - happy days";
    printf("%s", emptySpace);

    char str1[50] = "The numbers are: ";
    int numbers[] = { 1, 2, 3, 4, 5 };
    int i;
    
    for (i = 0; i < 5; i++) {
        char str2[5];
        sprintf(str2, "%d", numbers[i]); // Convert integer to string
        strcat(str1, str2); // Concatenate str2 to str1
        if (i < 4) {
            strcat(str1, ", "); // Add comma and space between numbers
        }
    }   
    printf("%s", str1); // Output: "The numbers are: 1, 2, 3, 4, 5"
    printf("%s", emptySpace);

    char cppHelloWorld[] = "This is a cpp program running on linux - happy days";
    cout << cppHelloWorld;

    return 1;
}
