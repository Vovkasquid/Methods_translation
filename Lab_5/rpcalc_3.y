/* Калькулятор для выражени в инфиксной нотации -- calc */

%{
#define YYSTYPE double
#include <math.h>
%}

/* Объявления BISON */
%token NUM
%left '-' '+'
%left '*' '/'

/* Далее следует грамматика */
%%
input:    /* пустая строка */
        | input line
;

line:     '\n'
        | exp '\n'  { printf ("\t%.10g\n", $1); }
;

exp:      NUM                { $$ = $1;         }
        | exp '+' exp        { $$ = $1 + $3;    }
        | exp '-' exp        { $$ = $1 - $3;    }
        | exp '*' exp        { $$ = $1 * $3;    }
        | exp '/' exp        { $$ = $1 / $3;    }
        | '(' exp ')'        { $$ = $2;         }
;
%%
/* start of programs */

#include "calcLex.c"

main()
{
 return  yyparse();
}

yyerror(char *s)
{
 fprintf(stderr,"%s\n",s);
}