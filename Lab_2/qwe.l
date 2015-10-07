	int n;
%%

				{ n = 0; }
[A-z][A-z]      { n++; printf("%s  ", yytext); REJECT;}
.              ;

%%

main() {yylex(); }
yywrap() {
	 printf ("\nCount: %d\n", n);
 return(1);
 }