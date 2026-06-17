#include<stdio.h>
#include<string.h>

struct symbol
{
    char name[20];
    int addr;
};

struct symbol table[100];
int count = 0;

void insert(char name[])
{
    strcpy(table[count].name, name);
    table[count].addr = count;
    count++;
}

void display()
{
    int i;
    printf("\nSymbol Table:\n");
    printf("Name\tAddress\n");
    for(i = 0; i < count; i++)
        printf("%s\t%d\n", table[i].name, table[i].addr);
}

int search(char name[])
{
    int i;
    for(i = 0; i < count; i++)
        if(strcmp(table[i].name, name) == 0)
            return i;
    return -1;
}

int main()
{
    insert("a");
    insert("b");
    insert("sum");

    display();

    if(search("b") != -1)
        printf("\nFound\n");
    else
        printf("\nNot Found\n");

    return 0;
}
