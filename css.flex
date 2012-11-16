/*** Definition section ***/

%{
/* C code to be copied verbatim */
#include <stdio.h>
%}

/* This tells flex to read only one input file */
%option noyywrap

%%
    /*** Rules section ***/

\/\*.+\*\/ { /* Ignore comments */ }

[0-9]*\.[0-9][eE][mM] { /* Ignore decimal em measurements */ }

\.[A-Za-z0-9\-_]+  {
            /* yytext is a string containing the matched text. */
            printf("Saw a class: %s\n", yytext);
        }

.|\n    {   /* Ignore all other characters. */   }

%%
/*** C Code section ***/

int main(void)
{
    /* Call the lexer, then quit. */
    yylex();
    return 0;
}
