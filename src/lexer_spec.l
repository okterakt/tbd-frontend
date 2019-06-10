%{
#include "def.h"
#include "y.tab.h"
%}

digit       [0-9]
letter      [a-zA-Z]
identifier  {letter}({letter}|{digit})*

%%
{digit}*        {
                    yylval.intval = atoi(yytext);
                    return TK_INT_LIT;
                }
"if"            {
                    return TK_IF;
                }
"=="            { return TK_EQ; }
"!="            { return TK_NE; }
"<="            { return TK_LE; }
">="            { return TK_GE; }
{identifier}    {
                    yylval.name = strdup(yytext);
                    return TK_IDEN;
                }
[ \t]           ; // ignore whitespace
\n              return 0; //logical EOF
.               return yytext[0];
%%