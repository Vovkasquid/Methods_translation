D [0-9]{2}
M [0-9]{2}
G [0-9]{4}
H [0-9]{2}
MIN [0-9]{2}
OST [^a-zA-Z я<>0-9"."" "]
    FILE* f;
    FILE* fl;
    int n; 

%%

					 { n = 0 ; }
([4-9][0-9]"."{M}"."{G}|([3][2-9]"."{M}"."{G}|([0][0]"."{M}"."{G}|([3][1]"."[0][4,6,9]"."{G}|([3][1]"."[1][1]"."{G}|([2][9]"."[0][2]"."[2][0][0][1,3,5,7,9]|([2][9]"."[0][2]"."[2][0][1][1,3,4,5]))))))).*\n {fprintf(fl,"Error day: %s", yytext);}
({D}"."[0][0]"."{G}|({D}"."[2-9[0-9]"."{G}|({D}"."[1][3-9]"."{G}))).*\n {fprintf(fl,"Error month: %s", yytext);}
({D}"."{M}"."[0-1][0-9]{3}|({D}"."{M}"."[2][0][1][6-9]|({D}"."{M}"."[3-9][0-9]{3}|({D}"."{M}"."[2][1-9][0-9]{2})))).*\n {fprintf(fl, "Error year: %s", yytext);}
({D}"."{M}"."{G}" "" "[3-9][0-9]|{D}"."{M}"."{G}" "" "[2][4-9]).*\n {fprintf(fl, "Error hours: %s", yytext); }
({D}"."{M}"."{G}" "" "{H}":"[6-9][0-9]).*\n {fprintf(fl, "Error minute: %s", yytext);}
({D}"."{M}"."{G}" "" "{H}":"{M}){OST}*\n {fprintf(fl,"Error Name: %s", yytext);}
.*\n 				{fprintf(f, "%s", yytext); n++; }


%%

main() {f=fopen("od.txt", "w");
		fl=fopen("error.txt", "w");
yylex();}
yywrap() {
	printf ("\nCount: %d\n", n);
	fclose(f);
	fclose(fl);
 	return(1);
 }
