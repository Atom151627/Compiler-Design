%{
#include<stdio.h>

int chars = 0;
int words = 0;
int lines = 0;
%}

%%

\n              { lines++; }
[ \t]+          { words++; }
.               { chars++; }

%%

int yywrap(){ return 1; }

int main()
{
    printf("Enter text:\n");
    yylex();

    printf("Characters = %d\n", chars);
    printf("Words = %d\n", words + 1);
    printf("Lines = %d\n", lines + 1);

    return 0;
}