%{
#include<stdio.h>
%}

%%

[A-Z]+      { printf("Capital word: %s\n", yytext); }

.|\n        ;

%%

int yywrap(){ return 1; }

int main()
{
    printf("Enter text:\n");
    yylex();
    return 0;
}