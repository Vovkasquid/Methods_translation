%{
#include <string.h>
%}
	int n;
	int i;

DELIM [" "\t\n\0]

%%

			 { n=0; i=0; }		 
(?:4[0-9]{12}(?:[0-9]{3})?)		{printf("Visa: "); if(luhn(yytext)) printf("Valid card\n"); else printf("Not valid card\n");}
(5[1-5][0-9]{14})	{printf("MasterCard: "); if(luhn(yytext)) printf("Valid card\n"); else printf("Not valid card\n");}
(3[47][0-9]{13})	{printf("American Express: "); if(luhn(yytext)) printf("Valid card\n"); else printf("Not valid card\n");}
(3(?:0[0-5]|[68][0-9])[0-9]{11})	{printf("Diners Club: "); if(luhn(yytext)) printf("Valid card\n"); else printf("Not valid card\n");}
(6(?:011|5[0-9]{2})[0-9]{12})	{printf("Discover: "); if(luhn(yytext)) printf("Valid card\n"); else printf("Not valid card\n");}
(?:2131|1800|35\d{3})\d{11}	{printf("JCB: "); if(luhn(yytext)) printf("Valid card\n"); else printf("Not valid card\n");}
.								;

%%

main() {yylex();}

int luhn(const char* cc)
{
	const int m[] = {0,2,4,6,8,1,3,5,7,9}; // mapping for rule 3
	int i, odd = 1, sum = 0;
 
	for (i = strlen(cc); i--; odd = !odd) {
		int digit = cc[i] - '0';
		sum += odd ? digit : m[digit];
	}
 
	return sum % 10 == 0;
}

yywrap() {
 return(1);
 }