%{
#include <stdio.h>

int vowels = 0;
int consonants = 0;
%}

%%

[aeiouAEIOU]    { vowels++; }
[a-zA-Z]        { consonants++; }
[0-9[:punct:][:space:]]  { /* ignore */ }

%%

int main() {
    FILE *file = fopen("input.txt", "r");
    if (!file) {
        printf("Error opening file\n");
        return 1;
    }
    yyin = file;
    yylex();
    fclose(file);
    printf("Vocales: %d\nConsonantes: %d\n", vowels, consonants);
    return 0;
}