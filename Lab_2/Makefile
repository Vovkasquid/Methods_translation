TARGET=ex1
FLAGS=-lfl

$(TARGET): lex.yy.o
	gcc lex.yy.o -o $(TARGET) $(FLAGS)
lex.yy.o: lex.yy.c
	gcc lex.yy.c -c
lex.yy.c: qwe.l
	flex qwe.l
clean:
	rm -f *.o $(TARGET)	lex.yy.c
