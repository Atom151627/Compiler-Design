%{
#include<stdio.h>
extern FILE *yyin;
%}

%%
\<[^>]*\>    { printf("%s\n", yytext); }
.|\n         ;
%%

int yywrap()
{
    return 1;
}

int main(int argc, char *argv[])
{
    if(argc < 2)
    {
        printf("Usage: a.exe <htmlfile>\n");
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
