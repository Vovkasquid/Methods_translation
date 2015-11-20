D [0-9]{2}
M [0-9]{2}
G [0-9]{4}
H [0-9]{2}
MIN [0-9]{2}
OST [A-z я<>0-9"."]
    FILE* f;
    FILE* fl;
    int n; 

%%

					 { n = 0 ; }
[4-9][0-9]"."{M}"."{G}.*\n {fprintf(fl,"Error day: %s", yytext);}

.*\n   {fprintf(f,"%s", yytext); }



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
