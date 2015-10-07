	int n;
%%
				 {n = 0;}
[A-z][A-z]       {n++; printf("%s",yytext); printf("  ");     }
.                ;
%%
main() {yylex(); }
yywrap() {
	printf ("\nCount: %d\n", n);
 return(1);
 }
