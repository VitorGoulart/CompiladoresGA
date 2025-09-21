
%{
int line = 0;
%}

delim       [ \t]
ws          {delim}+
newline     [\n]
letter      [A-Za-z]
digit       [0-9]
id          ({letter}|_)({letter}|{digit}|_)*
number      {digit}+(\.{digit}+)?(E[+|-]?{digit}+)?
string      \"[^"]*\"
operator    [-+*/=]
separator   [;,]
relop       ([<>](=)?)|(==)
logop       (&&)|(\|\|)|(!=)




%%

{ws}        {}
{newline}   {++line;}
"if"        {printf("KEYWORD(if\n)");}
"else"      {printf("KEYWORD(else)\n");}
"while"     {printf("KEYWORD(while)\n");}
"int"       {printf("KEYWORD(int)\n");}
"char"      {printf("KEYWORD(char)\n");}
"auto"      {printf("KEYWORD(auto)\n");}
"double"    {printf("KEYWORD(double)\n");}
"break"     {printf("KEYWORD(break)\n");}
"case"      {printf("KEYWORD(case)\n");}
"const"     {printf("KEYWORD(const)\n");}
"continue"  {printf("KEYWORD(continue)\n");}
"default"   {printf("KEYWORD(default)\n");}
"do"        {printf("KEYWORD(do)\n");}
"enum"      {printf("KEYWORD(enum)\n");}
"for"       {printf("KEYWORD(for)\n");}
"extern"    {printf("KEYWORD(extern)\n");}
"float"     {printf("KEYWORD(float)\n");}
"goto"      {printf("KEYWORD(goto)\n");}
"long"      {printf("KEYWORD(long)\n");}
"register"  {printf("KEYWORD(register)\n");}
"return"    {printf("KEYWORD(return)\n");}
"short"     {printf("KEYWORD(short)\n");}
"signed"    {printf("KEYWORD(signed)\n");}
"sizeof"    {printf("KEYWORD(sizeof)\n");}
"static"    {printf("KEYWORD(static)\n");}
"struct"    {printf("KEYWORD(struct)\n");}
"switch"    {printf("KEYWORD(switch)\n");}
"typedef"   {printf("KEYWORD(typedef)\n");}
"union"     {printf("KEYWORD(union)\n");}
"unsigned"  {printf("KEYWORD(unsigned)\n");}
"void"      {printf("KEYWORD(void)\n");}
"volatile"  {printf("KEYWORD(volatile)\n");}
{id}        {printf("IDENTIFIER(%s)\n", yytext);}
{number}    {printf("NUMBER(%s)\n", yytext);}
{string}    {printf("STRING(%s)\n", yytext);}
{relop}     {printf("RELOP(%s)\n", yytext);}
"("         {printf("LPAREN\n");}
")"         {printf("RPAREN\n");}
"{"         {printf("LBRACK\n");}
"}"         {printf("RBRACK\n");}
{separator} {printf("DELIM(%s)\n", yytext);}
{operator}  {printf("OPERATOR(%s)\n", yytext);}
{logop}     {printf("LOGOP(%s)\n", yytext);}
.           {printf("Lexical Error in line %d. Invalid Token\n", ++line); return 0;}
<<EOF>>     {return 0;}

%%

int yywrap(void) {return 1;}

int main() {
  yylex();

  return 0;
}

