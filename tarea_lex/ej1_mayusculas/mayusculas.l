%{
#include <stdio.h>
#include <ctype.h>
%}

%option noyywrap

%%
^[A-Z][a-zA-Z0-9_]*          { printf("Palabra reservada/importante: %s\n", yytext); }
[ \t][A-Z][a-zA-Z0-9_]*      { printf("Palabra reservada/importante: %s\n", yytext + 1); }
(.|\n)                       { ECHO; }

%%

int main(void) {
    yylex();
    return 0;
}
