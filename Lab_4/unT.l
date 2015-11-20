%Start L1 L2
%{
#include <string.h>
%}
	int n;
	int i;
	char tmp[256];

DELIM [" "\t\n\0]

%%

			 { n=0; i=0; BEGIN L1; }
[0-9]+		 {yymore();}
"\0"		 {yytext[yyleng-1]='\0'; printf("%s\n",yytext);}

%%

main() {yylex();}
yywrap() {
	
 return(1);
 }