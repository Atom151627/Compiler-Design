#include<stdio.h>
#include<string.h>

char input[20];
int i = 0;

void E();
void E1();
void T();
void T1();
void F();

void E()
{
    T();
    E1();
}

void E1()
{
    if(input[i] == '+')
    {
        i++;
        T();
        E1();
    }
}

void T()
{
    F();
    T1();
}

void T1()
{
    if(input[i] == '*')
    {
        i++;
        F();
        T1();
    }
}

void F()
{
    if(input[i] == '(')
    {
        i++;
        E();
        if(input[i] == ')')
            i++;
    }
    else if(input[i] == 'i')   // id simplified as 'i'
        i++;
    else
        printf("Error\n");
}
int main()
{
    printf("Enter string:\n");
    scanf("%s", input);
    E();
    if(input[i] == '\0')
        printf("Valid string\n");
    else
        printf("Invalid string\n");
    return 0;
}
