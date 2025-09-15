delim       [ \t \n]
ws          {delim}+
letter      [A-Za-z]
digit       [0-9]
id          ({letter}|_)({letter}|{digit}|_)*
number      {digit}+(\.{digit}+)?(E[+|-]?{digit}+)?
string      \"[^"]*\"
operator    [-+*/=]


%%

{ws}        {}
"if"        {printf("IF\n");}
"else"      {printf("ELSE\n");}
"while"     {printf("WHILE\n");}
"int"       {printf("INT\n");}
"char"      {printf("CHAR\n");}
"auto"      {printf("AUTO\n");}
"double"    {printf("DOUBLE\n");}
"break"     {printf("BREAK\n");}
"case"      {printf("CASE\n");}
"const"     {printf("CONST\n");}
"continue"  {printf("CONTINUE\n");}
"default"   {printf("DEFAULT\n");}
"do"        {printf("DO\n");}
"enum"      {printf("ENUM\n");}
"for"       {printf("FOR\n");}
"extern"    {printf("EXTERN\n");}
"float"     {printf("FLOAT\n");}
"goto"      {printf("GOTO\n");}
"long"      {printf("LONG\n");}
"register"  {printf("REGISTER\n");}
"return"    {printf("RETURN\n");}
"short"     {printf("SHORT\n");}
"signed"    {printf("SIGNED\n");}
"sizeof"    {printf("SIZEOF\n");}
"static"    {printf("STATIC\n");}
"struct"    {printf("STRUCT\n");}
"switch"    {printf("SWITCH\n");}
"typedef"   {printf("TYPEDEF\n");}
"union"     {printf("UNION\n");}
"unsigned"  {printf("UNSIGNED\n");}
"void"      {printf("VOID\n");}
"volitile"  {printf("VOLITILE\n");}
{id}        {printf("IDENTIFIER(%s)\n", yytext);}
{number}    {printf("NUMBER(%s)\n", yytext);}
{string}    {printf("STRING(%s)\n", yytext);}
"<"         {printf("LT\n");}
"<="        {printf("LE\n");}
"=="        {printf("EQ\n");}
"!="        {printf("NE\n");}
">"         {printf("GT\n");}
">="        {printf("GE\n");}
"("         {printf("LPAREN\n");}
")"         {printf("RPAREN\n");}
";"         {printf("DELIM(;)\n");}
{operator}  {printf("OPERATOR(%s)\n", yytext);}
.           {printf("Lexical Error. Invalid Token\n"); return 0;}
<<EOF>>     {return 0;}

%%

int yywrap(void) {return 1;}

int main() {
  yylex();

  return 0;
}

