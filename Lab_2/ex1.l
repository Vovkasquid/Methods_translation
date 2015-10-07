
	int l, w, c;

%%

		   { w = c = 0; l = 1; }
[a-zA-Z]/[a-zA-Z]      { w++; c+=yyleng; printf("%s\n",yytext); }
\n 		   { l++; }
.		   { c++;   }

%%

main(int argc, char **argv) {
	yylex();

}

yywrap() {
	printf( "Lines: %d\nW: %d\n", l, w);
	return(1);
}