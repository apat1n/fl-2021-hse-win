%{
#include <iostream>
#include "gram.tab.hpp"
%}

%option yylineno
%option noyywrap

COMMENT  #.*
IDENT    [a-z][a-zA-Z0-9]*
VAR      ([A-Z][a-zA-Z0-9]*|[1-9][0-9]*)

%%
"->"     { return UNIFY; }
"&&"     { return AND; }
"||"     { return OR; }

"("      { return LP; }
")"      { return RP; }
";"      { return SC; }
"="      { return EQ; }
"main"   { return MAIN; }
{IDENT}  {
    char *buf = new char[strlen(yytext) + 1];
    strcpy(buf, yytext);
    yylval.val = buf;
    return IDENT;
}
{VAR}    {
    char *buf = new char[strlen(yytext) + 1];
    strcpy(buf, yytext);
    yylval.val = buf;
    return VAR;
}
<<EOF>>  { return 0; }
[ \t\n]+ { }


%%