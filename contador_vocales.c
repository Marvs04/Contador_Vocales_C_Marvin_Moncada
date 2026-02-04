#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define token types
typedef enum {
  TOKEN_VOWEL,
  TOKEN_CONSONANT,
  TOKEN_IGNORE,
  TOKEN_EOF, // End of file
  TOKEN_ERROR
} TokenType;

const char *TOKENS_STRING[] = {
    "TOKEN_VOWEL", "TOKEN_CONSONANT", "TOKEN_IGNORE", "TOKEN_EOF", "TOKEN_ERROR",
};

// Define Token map
typedef struct {
  TokenType type;
  char value[32];
} Token;

Token get_next_token(const char **input) {
  Token token;

  // Skip: White spaces
  while (isspace(**input))
    (*input)++;

  if (**input == '\0') {
    token.type = TOKEN_EOF;
    token.value[0] = '\0';
    return token;
  }

  char c = **input;
  if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' ||
      c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U') {
    token.type = TOKEN_VOWEL;
    token.value[0] = c;
    token.value[1] = '\0';
    (*input)++;
    return token;
  }

  if (isalpha(c)) {
    token.type = TOKEN_CONSONANT;
    token.value[0] = c;
    token.value[1] = '\0';
    (*input)++;
    return token;
  }

  // Ignore numbers and punctuation
  (*input)++;
  token.type = TOKEN_IGNORE;
  token.value[0] = '\0';
  return token;
}

int main() {
  FILE *file = fopen("input.txt", "r");
  if (!file) {
    printf("Error opening file\n");
    return 1;
  }

  char buffer[1024];
  size_t n = fread(buffer, 1, sizeof(buffer) - 1, file);
  buffer[n] = '\0';
  fclose(file);

  const char *pointer = buffer;

  int vowels = 0, consonants = 0;

  Token token;

  do {
    token = get_next_token(&pointer);
    if (token.type == TOKEN_VOWEL) vowels++;
    else if (token.type == TOKEN_CONSONANT) consonants++;
  } while (token.type != TOKEN_EOF && token.type != TOKEN_ERROR);

  printf("Vocales: %d\nConsonantes: %d\n", vowels, consonants);

  return 0;
}