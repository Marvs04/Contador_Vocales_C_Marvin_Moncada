%{
#include <stdio.h>
%}

%option noyywrap

%%
[ \t]+        { printf(" "); }
.             { ECHO; }
\n            { ECHO; }

%%

int main(void) {
    yylex();
    return 0;
}
