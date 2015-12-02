%{
#include <ctype.h>
#include <stdio.h>
double vbltable[26];	
%}

%union {
	double dval;
	int vblno;
}

%token <vblno> NAME
%token <dval> NUMBER
%left '-' '+'
%left '*' '/'

%type <dval> expression

%%
statement_list: statement '\n'
	|	statement_list statement '\n'
	;
statement: NAME '=' expression {vbltable[$1] = $3;}
	|	expression		{printf("= %g\n", $1);}
	;
expression: expression '+' expression {$$ = $1 + $3;}
	|		expression '-' expression {$$ = $1 - $3;}
	|		expression '*' expression {$$ = $1 * $3;}
	|		expression '/' expression
						{	if($3 == 0.0)
							yyerror("divide by zero");
							else
								$$ = $1 / $3;
						}
	|		'(' expression ')'	{$$ = $2;}
	|		NUMBER
	|		NAME		{$$ = vbltable[$1];}
	;
%%

main()
{
 return  yyparse();
}

yyerror(char *s)
{
 fprintf(stderr,"%s\n",s);
}