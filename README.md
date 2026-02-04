# Contador de Vocales con Lex

Este proyecto implementa un contador de vocales y consonantes usando Lex (Flex).

## Archivos
- `contador.l`: Archivo de definición del lexer.
- `Makefile`: Para compilar el proyecto.
- `input.txt`: Archivo de entrada de ejemplo.

## Requisitos
- Flex (instalar desde https://gnuwin32.sourceforge.net/packages/flex.htm o usar Chocolatey: `choco install winflexbison`)
- GCC (MinGW o similar)
- Make (opcional, o usar comandos manuales)

## Compilación
1. Instalar Flex si no está instalado.
2. Ejecutar `make` en el directorio del proyecto, o manualmente:
   - `flex contador.l`
   - `gcc lex.yy.c -o contador.exe`

## Ejecución
- `.\contador.exe`
- Lee de `input.txt` y imprime las vocales y consonantes.

## Prueba
Con `input.txt` = "Hello World 123!":
- Vocales: 3
- Consonantes: 7