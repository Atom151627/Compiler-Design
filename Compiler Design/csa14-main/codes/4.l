%{
#include<stdio.h>
%}

%%

[\+\-\*/]      { printf("Valid Operator: %s\n", yytext); }

.              { printf("Invalid Operator: %s\n", yytext); }

%%

int yywrap(){ return 1; }

int main()
{
    printf("Enter operator:\n");
    yylex();
}