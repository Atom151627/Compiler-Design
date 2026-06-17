%{
#include<stdio.h>
int line = 1;
extern FILE *yyin;
%}

%%
.*\n      { printf("%d %s", line++, yytext); }
%%

int yywrap()
{
    return 1;
}

int main(int argc, char *argv[])
{
    if(argc < 2)
    {
        printf("Usage: a.exe <filename>\n");
        return 0;
    }

    yyin = fopen(argv[1], "r");

    if(yyin == NULL)
    {
        printf("File not found\n");
        return 0;
    }

    yylex();

    return 0;
}
