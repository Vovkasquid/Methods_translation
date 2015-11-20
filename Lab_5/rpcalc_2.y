/* Калькулятор обратной польской нотации. */

%{
#define YYSTYPE int
#include <math.h>
%}

%token NUM

%% /* Далее следуют правила грамматики и действия */

input:    /* пусто */
        | input line
;

line:     '\n'
        | exp '\n'  { printf ("\t%d\n", $1); }
;

exp:      NUM             { $$ = $1;         }
        | exp exp '+'     { $$ = $1 + $2;    }
        | exp exp '-'     { $$ = $1 - $2;    }
        | exp exp '*'     { $$ = $1 * $2;    }
        | exp exp '/'     { $$ = $1 / $2;    }
;
%%
/* start of programs */

#include "calcLex1.c"

main()
{
 return  yyparse();
}

yyerror(char *s)
{
 fprintf(stderr,"%s\n",s);
}