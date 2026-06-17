%{
#include<stdio.h>
%}

%%

"//".*                      { printf("Single-line comment\n"); }

"/*"([^*]|\n|\*+[^*/])*\*+"/"   { printf("Multi-line comment\n"); }

.+                          { printf("Not a comment\n"); }

%%

int yywrap(){ return 1; }

int main()
{
    printf("Enter line:\n");
    yylex();
}