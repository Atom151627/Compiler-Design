#include<stdio.h>
#include<string.h>

char str[20];
int i = 0;

void S()
{
    if(str[i] == 'a')
    {
        i++;
        if(str[i] == 'b')
            i++;
        else
        {
            S();
            if(str[i] == 'b')
                i++;
        }
    }
}

int main()
{
    printf("Enter string:\n");
    scanf("%s", str);

    S();

    if(str[i] == '\0')
        printf("Valid string\n");
    else
        printf("Invalid string\n");

    return 0;
}