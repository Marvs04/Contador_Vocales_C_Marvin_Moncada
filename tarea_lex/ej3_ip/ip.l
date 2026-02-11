%{
#include <stdio.h>

int a, b, c, d;
%}

%option noyywrap

%%
([0-9]{1,3}\.){3}[0-9]{1,3} {
    if (sscanf(yytext, "%d.%d.%d.%d", &a, &b, &c, &d) == 4 &&
        a < 256 && b < 256 && c < 256 && d < 256) {
        printf("IP valida: %s\n", yytext);
    } else {
        printf("IP invalida (fuera de rango): %s\n", yytext);
    }
}
[ \t\n]+          ;
.                ;

%%

int main(void) {
    yylex();
    return 0;
}
