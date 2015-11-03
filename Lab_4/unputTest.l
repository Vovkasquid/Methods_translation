%{
#include <string.h>
%}
	int n;
	int i;

DELIM [" "\t\n\0]

%%

			 { n=0; i=0; }
^(?:4[0-9]{12}(?:[0-9]{3})?)	{printf("card\n");}
.								;

%%

main() {yylex();}
yywrap() {
	printf ("\nCount: %d\n", n);
 return(1);
 }