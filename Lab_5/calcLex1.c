/* Лексический анализатор возвращает вещественное число
   с двойной точностью в стеке и лексему NUM, или прочитанную
   литеру ASCII, если это не число. Все пробелы и знаки
   табуляции пропускаются, в случае конца файла возвращается 0. */
/* GIT TEST STRING */
#include <ctype.h>
#include <stdio.h>

int
yylex (void)
{
  int c;

  /* пропустить промежутки  */
  while ((c = getchar ()) == ' ' || c == '\t')
    ;
  
  /* обработка чисел */
  if (isdigit (c))
    {
      yylval = c - '0';
      while (isdigit (c = getchar ()))
        {
          yylval = yylval * 10 + c - '0';
        }
      ungetc (c, stdin);
      return NUM;
    }
  /* вернуть конец файла  */
  if (c == EOF)
    return 0;
  /* вернуть одну литеру */
  return c;
}