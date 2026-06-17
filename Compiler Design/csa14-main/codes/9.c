#include<stdio.h>

int main()
{
    printf("Original Grammar:\n");
    printf("L -> L,S | S\n");

    printf("\nAfter Removing Left Recursion:\n");
    printf("L -> S L'\n");
    printf("L' -> , S L' | ε\n");

    return 0;
}