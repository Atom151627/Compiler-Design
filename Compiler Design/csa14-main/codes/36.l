%{
#include<stdio.h>
#include<string.h>
int a, b;
%}

%%
[0-9]+[\+\-\*/][0-9]+   {
    sscanf(yytext, "%d%*c%d", &a, &b);

    if(strchr(yytext, '+'))
        printf("Result = %d\n", a+b);

    else if(strchr(yytext, '-'))
        printf("Result = %d\n", a-b);

    else if(strchr(yytext, '*'))
        printf("Result = %d\n", a*b);

    else if(strchr(yytext, '/'))
        printf("Result = %d\n", a/b);
}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter expression:\n");
    yylex();

    return 0;
}