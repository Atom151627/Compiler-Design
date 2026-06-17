%{
#include<stdio.h>
%}

%%

cat     { printf("dog"); }

.|\n    { printf("%s", yytext); }

%%

int yywrap(){ return 1; }

int main()
{
    printf("Enter text:\n");
    yylex();
}