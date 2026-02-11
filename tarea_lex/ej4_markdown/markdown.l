%{
#include <stdio.h>
%}

%option noyywrap

%%
\[[^\]]+\]\([^\)]+\) {
    char text[1024];
    char url[1024];
    if (sscanf(yytext, "[%[^]]](%[^)])", text, url) == 2) {
        printf("Texto: %s\n", text);
        printf("URL: %s\n", url);
    } else {
        printf("Enlace markdown: %s\n", yytext);
    }
}
(.|\n)        { ECHO; }

%%

int main(void) {
    yylex();
    return 0;
}
