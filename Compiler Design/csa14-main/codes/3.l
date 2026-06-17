%{
#include<stdio.h>
%}

%%

[ \t\n]+                ;   /* ignore spaces */

"//".*                  ;   /* ignore comments */

"/*"([^*]|\n|\*+[^*/])*\*+"/"   ;   /* ignore multi-line */

.                       { printf("%s", yytext); }

%%

int yywrap(){ return 1; }

int main()
{
    printf("Processed output:\n");
    yylex();
}