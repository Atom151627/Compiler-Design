%{
#include<stdio.h>
int macro = 0, header = 0;
extern FILE *yyin;
%}

%%
^[ \t]*#define      { macro++; }
^[ \t]*#include     { header++; }
.|\n                ;
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
    printf("Macros = %d\n", macro);
    printf("Headers = %d\n", header);
    return 0;
}
