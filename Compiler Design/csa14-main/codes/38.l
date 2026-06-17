%{
#include<stdio.h>

int max = 0;
%}

%%

[a-zA-Z]+    {
                int len = yyleng;
                if(len > max)
                    max = len;
             }

.|\n          ;

%%

int yywrap(){ return 1; }

int main()
{
    printf("Enter sentence:\n");
    yylex();

    printf("Length of longest word = %d\n", max);
}