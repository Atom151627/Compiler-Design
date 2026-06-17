#include<stdio.h>
#include<string.h>

int main()
{
    char op1, op2, op;
    
    printf("Enter expression (a+b): ");
    scanf("%c%c%c", &op1, &op, &op2);

    printf("\nGenerated Code:\n");
    printf("MOV R0, %c\n", op1);

    switch(op)
    {
        case '+': printf("ADD R0, %c\n", op2); break;
        case '-': printf("SUB R0, %c\n", op2); break;
        case '*': printf("MUL R0, %c\n", op2); break;
        case '/': printf("DIV R0, %c\n", op2); break;
    }

    printf("MOV RESULT, R0\n");

    return 0;
}