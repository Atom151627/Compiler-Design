%{
#include<stdio.h>
%}

%%

[ \t\n]+                ;   /* ignore spaces */

"//".*                  ;   /* ignore single-line comment */
"/*"([^*]|\n|\*+[^*/])*\*+"/"   ;   /* ignore multi-line comment */

[a-zA-Z_][a-zA-Z0-9_]*  { printf("Identifier: %s\n", yytext); }

[0-9]+                  { printf("Constant: %s\n", yytext); }

[\+\-\*/=]              { printf("Operator: %s\n", yytext); }

.                       ;

%%

int yywrap(){ return 1; }

int main()
{
    printf("Enter code:\n");
    yylex();
}
