NODELIM [^" "\t\n]
	int l, w, c;

%%

		   { w = c = 0; l = 1; }
{NODELIM}+ { w++; c+=yyleng; }
\n 		   { l++; }
.		   { c++; }

%%

main(int argc, char **argv) {
	yylex();
}

yywrap() {
	printf( "Lines: %d\nWords: %d\nChars: %d\n", l, w, c);
	return(1);
}