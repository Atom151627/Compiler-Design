%{
#include<stdio.h>

int pos = 0, neg = 0;
%}

%%

[-][0-9]+   { neg++; printf("Negative: %s\n", yytext); }

[0-9]+      { pos++; printf("Positive: %s\n", yytext); }

[ \t\n]+    ;

.           ;

%%

int yywrap(){ return 1; }

int main()
{
    printf("Enter numbers:\n");
    yylex();

    printf("Positive count = %d\n", pos);
    printf("Negative count = %d\n", neg);

    return 0;
}