%{
#include<stdio.h>
#include<string.h>

int count = 0;
%}

%%

hello      { count++; }

.|\n       ;

%%

int yywrap(){ return 1; }

int main()
{
    printf("Enter sentence:\n");
    yylex();

    printf("Frequency of 'hello' = %d\n", count);
}
