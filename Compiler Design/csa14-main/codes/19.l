%{
#include<stdio.h>
int chars = 0, words = 0, lines = 0;
extern FILE *yyin;
%}

%%
"//".*                  ;   /* ignore single-line comments */
"/*"([^*]|\n|\*+[^*/])*\*+"/"   ;   /* ignore multi-line comments */
\n                      { lines++; }
[ \t]+                  { words++; }
.                       { chars++; }
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
    printf("Characters = %d\n", chars);
    printf("Words = %d\n", words + 1);
    printf("Lines = %d\n", lines + 1);
    return 0;
}
