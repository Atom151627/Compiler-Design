%{
#include<stdio.h>
int count = 0;
extern FILE *yyin;
extern FILE *yyout;
%}

%%
"//".*                          { count++; }   /* single-line comment */
"/*"([^*]|\n|\*+[^*/])*\*+"/"   { count++; }   /* multi-line comment */
.|\n                            { fprintf(yyout, "%s", yytext); }
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
    yyout = fopen("output.c", "w");
    yylex();
    printf("Number of comment lines = %d\n", count);
    printf("Comments removed and written into output.c\n");
    return 0;
}