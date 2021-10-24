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
"->"     { printf("UNIFY\n"); return UNIFY; }
"&&"     { printf("AND\n"); return AND; }
"||"     { printf("OR\n"); return OR; }

"("      { printf("LP\n"); return LP; }
")"      { printf("RP\n"); return RP; }
";"      { printf("SC\n"); return SC; }
"="      { printf("EQ\n"); return EQ; }
"main"   { printf("MAIN\n"); return MAIN; }
{IDENT}  {
    char *buf = new char[strlen(yytext) + 1];
    strcpy(buf, yytext);
    yylval.val = buf;
    printf("IDENT\n");
    return IDENT;
}
{VAR}    {
    char *buf = new char[strlen(yytext) + 1];
    strcpy(buf, yytext);
    yylval.val = buf;
    printf("VAR\n");
    return VAR;
}
<<EOF>>  { return 0; }
[ \t\n]+ { }


%%