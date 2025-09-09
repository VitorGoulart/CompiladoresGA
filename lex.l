delim     [ \t \n]
ws        {delim}+
letter    [A-Za-z]
digit     [0-9]
id        ({letter}|_)({letter}|{digit}|_)*
number    {digit}+(\.{digit}+)?(E[+|-]?{digit}+)?
string    \"[^"]*\"
operator  [-+*/]

%%

{ws}      {}
"if"      {printf("IF\n");}
"then"    {printf("THEN\n");}
"else"    {printf("ELSE\n");}
"while"   {printf("WHILE\n");}  
{id}      {printf("IDENTIFIER(%s)\n", yytext);}
{number}  {printf("NUMBER(%s)\n", yytext);}
{string}  {printf("STRING(%s)\n", yytext);}
"<"       {printf("LT\n");}
"<="      {printf("LE\n");}
"="       {printf("EQ\n");}
"<>"      {printf("NE\n");}
">"       {printf("GT\n");}
">="      {printf("GE\n");}
{operator} {printf("OPERATOR(%s)\n",yytext);}
.         {printf("Lexical Error. Invalid Token\n"); return 0;}
<<EOF>>   {return 0;}

%%

int yywrap(void) {return 1;}

int main() {
  yylex();

  return 0;
}

