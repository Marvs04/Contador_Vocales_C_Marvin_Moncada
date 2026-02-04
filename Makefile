contador: contador.l
	flex contador.l
	gcc lex.yy.c -o contador.exe

clean:
	rm -f lex.yy.c contador.exe