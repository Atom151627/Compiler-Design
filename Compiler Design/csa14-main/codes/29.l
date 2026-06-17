%{
#include<stdio.h>
extern FILE *yyin;
%}

%%
"#include"[ ]*<[^>]*>   { printf("Header File: %s\n", yytext); }
"int"|"void"            { printf("Keyword: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("Identifier: %s\n", yytext); }
[0-9]+                  { printf("Constant: %s\n", yytext); }
"(" | ")" | "{" | "}"   { printf("Symbol: %s\n", yytext); }
"," | ";"               { printf("Punctuation: %s\n", yytext); }
"="                     { printf("Operator: %s\n", yytext); }
.|\n                    ;
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