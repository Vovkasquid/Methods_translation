%{
#include <string.h>
%}
	int n;

DELIM [" "\t\n]

%%

					 { n=0; }
[A-z]{DELIM}		 { unput(yytext[0]);}
{DELIM}[A-z]		 { unput(yytext[1]);}
[A-z][A-z]       {n++; printf("%s",yytext); printf("  ");  }

%%

main() {yylex();}
yywrap() {
	printf ("\nCount: %d\n", n);
 return(1);
 }