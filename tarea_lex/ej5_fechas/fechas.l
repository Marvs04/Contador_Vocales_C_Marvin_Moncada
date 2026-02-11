%{
#include <stdio.h>

int d, m, y;
%}

%option noyywrap

%%
([0-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/[0-9]{4} {
    if (sscanf(yytext, "%d/%d/%d", &d, &m, &y) == 3) {
        int valido = 1;
        if (m < 1 || m > 12) valido = 0;
        if (d < 1 || d > 31) valido = 0;
        if (m == 2 && d > 29) valido = 0;
        if ((m == 4 || m == 6 || m == 9 || m == 11) && d > 30) valido = 0;
        if (valido) {
            printf("Fecha valida: %s\n", yytext);
        } else {
            printf("Fecha estructuralmente correcta pero logica imposible: %s\n", yytext);
        }
    }
}
[ \t\n]+       ;
.              ;

%%

int main(void) {
    yylex();
    return 0;
}
