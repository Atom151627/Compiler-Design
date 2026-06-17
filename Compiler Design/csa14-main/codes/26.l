%{
#include<stdio.h>
%}

%%

[a-z0-9._]+@[a-z]+\.(com|in)   { printf("Valid Email\n"); }

.+                             { printf("Invalid Email\n"); }

%%

int yywrap(){ return 1; }

int main()
{
    printf("Enter email:\n");
    yylex();
    return 0;
}