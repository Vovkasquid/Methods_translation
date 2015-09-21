%{
int chars = 0;
int words = 0;
int lines = 1;
%}

%%

[a-zA-Z]+ { words++; chars += strlen(yytext); }
\n 		  { chars++; lines++; }
.         { chars++; }

%%

main(int argc, char **argv)
{
yylex();
printf("lines: %8d\nwords: %8d\nchars: %8d\n", lines, words, chars);
}