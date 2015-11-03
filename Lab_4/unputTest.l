%{
#include <string.h>
%}
	int n;
	int i;

DELIM [" "\t\n\0]

%%

			 { n=0; i=0; }
(?:4[0-9]{12}(?:[0-9]{3})?)		{printf("Visa\n");}
(5[1-5][0-9]{14})	{printf("MasterCard\n");}
(3[47][0-9]{13})	{printf("American Express\n");}
(3(?:0[0-5]|[68][0-9])[0-9]{11})	{printf("Diners Club\n");}
(6(?:011|5[0-9]{2})[0-9]{12})	{printf("Discover\n");}
(?:2131|1800|35\d{3})\d{11}	{printf("JCB\n");}
.								;

%%

main() {yylex();}
yywrap() {
	printf ("\nCount: %d\n", n);
 return(1);
 }