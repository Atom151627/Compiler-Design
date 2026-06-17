%{
#include<stdio.h>

int spaces = 0;
int lines = 0;
%}

%%

" "         { spaces++; }        /* count space */
"\t"        { spaces++; }        /* count tab as whitespace */
"\n"        { lines++; }         /* count newline */

.           ;                    /* ignore other characters */

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter text:\n");
    yylex();

    printf("\nNumber of whitespaces = %d\n", spaces);
    printf("Number of newlines = %d\n", lines);

    return 0;
}