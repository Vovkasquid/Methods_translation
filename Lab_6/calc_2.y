%{

#include <string.h>
#include <ctype.h>
#include <stdio.h>


#define NSYMS 20 /* tabmaximum numver of symbols */

struct symtab {
	char *name;
	double value;
} symtab[NSYMS];

struct symtab *symlook();
%}

%union {
	double dval;
	struct symtab *symp;
}

%token <symp> NAME
%token <dval> NUMBER
%left '-' '+'
%left '*' '/'

%type <dval> expression
%%
statement_list: statement '\n'
	|	statement_list statement '\n'
	;

statement: NAME '=' expression { $1->value = $3; }
	|	expression	{ printf("= %g\n", $1); }

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
	|		NAME		{$$ = $1->value; }
	;
%%

struct symtab *symlook(char *s)
{
	char *p;
	struct symtab *sp;

	for (sp = symtab; sp < &symtab[NSYMS]; sp++) {
		if (sp->name && !strcmp(sp->name, s))
			return sp;

		if (!sp->name) {
			sp->name = strdup(s);
			return sp;
		}
	}
	yyerror("Too many symbols");
	exit(1);
}

main()
{
 return  yyparse();
}

yyerror(char *s)
{
 fprintf(stderr,"%s\n",s);
}