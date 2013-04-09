package analizadorlexico;
import static analizadorlexico.Token.*;
import java_cup.runtime.*; 
%%

%class Lexer
%type Token
%line

digit = [0-9]
letter = [a-zA-Z]|":"|"."|"%"|"!"|"@"|"#"
TEXT = {letter}({letter}|{digit}|"_")*
space = \t|\f|" "|\r|\n
LineEnd = \r|\n|\r\n
InputChar = [^\r\n]
heading = "h"{digit} 
Comment = "<!--"([^-]|-[^-]|--+[^->])*-*-->
String = "\""[^\*\n"\""]*"\""


%{
public String lexeme;
%}
%%

"<!--"([^"--"]|"--"[^>]) {lexeme=yytext(); // Agarra comentarios sin terminar
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(ERROR_UNTERM_COMMENT, Posicion);
            //******************************
            return aux;}

{Comment} {/* ignore */}

{String}  {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(STRING, Posicion);
            //******************************
            return aux;}

"\""[^\*\n"\""]*"\n" {lexeme=yytext(); //agarra srings invalidos
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(ERROR_UNTERM_STRING, Posicion);
            //******************************
            return aux;}

"="		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(EQUALS, Posicion);
            //******************************
            return aux;}
";"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(SEMICOLON, Posicion);
            //******************************
            return aux;}
","		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(COMA, Posicion);
            //******************************
            return aux;}
"("		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(LPAR, Posicion);
            //******************************
            return aux;}
")"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(RPAR, Posicion);
            //******************************
            return aux;}
"{"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(LCBRACE, Posicion);
            //******************************
            return aux;}
"}"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(RCBRACE, Posicion);
            //******************************
            return aux;}


">"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(END_TAG, Posicion);
            //******************************
            return aux;}
"<"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(START_TAG, Posicion);
            //******************************
            return aux;}
"/"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(CLOSE_DECLARATION, Posicion);
            //******************************
            return aux;}

"col"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(COLUMN, Posicion);
            //******************************
            return aux;}

"tbody"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(TABLE_BODY, Posicion);
            //******************************
            return aux;}

"tfoot"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(TABLE_FOOT, Posicion);
            //******************************
            return aux;}

"thead"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(TABLE_HEAD, Posicion);
            //******************************
            return aux;}

"scope"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(SCOPE, Posicion);
            //******************************
            return aux;}

"th"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(TABLE_HEADER, Posicion);
            //******************************
            return aux;}

"caption"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(CAPTION, Posicion);
            //******************************
            return aux;}

"summary"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(SUMMARY, Posicion);
            //******************************
            return aux;}

"address"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(ADDRESS, Posicion);
            //******************************
            return aux;}

"?"     {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(META_DECLARATION, Posicion);
            //******************************
            return aux;}

"version"     {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(VERSION, Posicion);
            //******************************
            return aux;}

"encoding"     {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(ENCODING, Posicion);
            //******************************
            return aux;}

"option"     {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(OPTION, Posicion);
            //******************************
            return aux;}

"selected"   {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(SELECTED, Posicion);
            //******************************
            return aux;}

"select"     {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(SELECT, Posicion);
            //******************************
            return aux;}

"xml:lang"      {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(XML_LANGUAGE, Posicion);
            //******************************
            return aux;}

"xmlns:xsi"      {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(XMLNS_XSI, Posicion);
            //******************************
            return aux;}

"xml:space"      {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(XML_SPACE, Posicion);
            //******************************
            return aux;}

"xmlns"     {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(XMLNS, Posicion);
            //******************************
            return aux;}

"http-equiv"     {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(HTTP_EQUIVALENT, Posicion);
            //******************************
            return aux;}

"title"     {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(TITLE, Posicion);
            //******************************
            return aux;}

"lang"     {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(LANGUAGE, Posicion);
            //******************************
            return aux;}

"content"     {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(CONTENT, Posicion);
            //******************************
            return aux;}

"html"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(HTML, Posicion);
            //******************************
            return aux;}
"head"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(HEAD, Posicion);
            //******************************
            return aux;}
"link"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(DOCUMENT_EXTERNALSOURCE_LINK, Posicion);
            //******************************
            return aux;}
"style"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(STYLE, Posicion);
            //******************************
            return aux;}
"base"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(DEFAULT_ADDRESS, Posicion);
            //******************************
            return aux;}
"meta"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(META_DATA, Posicion);
            //******************************
            return aux;}
"script"	{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(SCRIPT, Posicion);
            //******************************
            return aux;}
"!DOCTYPE"      {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(DOCTYPE, Posicion);
            //******************************
            return aux;}
"body"          {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(BODY, Posicion);
            //******************************
            return aux;}
"br"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(BREAK, Posicion);
            //******************************
            return aux;}
"hr"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(HORIZONTAL_RULE, Posicion);
            //******************************
            return aux;}
"img"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(IMAGE, Posicion);
            //******************************
            return aux;}
"src"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(SOURCE, Posicion);
            //******************************
            return aux;}
"alt"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(ALTERNATIVE_NAME, Posicion);
            //******************************
            return aux;}
"p"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(PARRAGRAPH, Posicion);
            //******************************
            return aux;}
"table"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(TABLE, Posicion);
            //******************************
            return aux;}
"tr"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(TABLE_ROW, Posicion);
            //******************************
            return aux;}
"td"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(TABLE_ITEM, Posicion);
            //******************************
            return aux;}
"ul"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(UNORDERED_LIST, Posicion);
            //******************************
            return aux;}
"ol"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(ORDERED_LIST, Posicion);
            //******************************
            return aux;}
"li"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(LIST_ITEM, Posicion);
            //******************************
            return aux;}
"dl"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(DEFINITION_LIST, Posicion);
            //******************************
            return aux;}
"dt"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(DEFINITION_LIST_ITEM, Posicion);
            //******************************
            return aux;}
"dd"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(DEFINITION_LIST_DESCRIPTION, Posicion);
            //******************************
            return aux;}

"div"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(BLOCK_LEVEL_SECTION, Posicion);
            //******************************
            return aux;}
"span"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(BLOCK_LEVEL_INLINE, Posicion);
            //******************************
            return aux;}

"form"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(FORM, Posicion);
            //******************************
            return aux;}
"input"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(INPUT, Posicion);
            //******************************
            return aux;}
"type"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(TYPE, Posicion);
            //******************************
            return aux;}
"name"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(NAME, Posicion);
            //******************************
            return aux;}
"value"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(VALUE, Posicion);
            //******************************
            return aux;}
"action"	{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(INPUT_ACTION, Posicion);
            //******************************
            return aux;}
"method"	{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(INPUT_METHOD, Posicion);
            //******************************
            return aux;}

"iframe"	{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(IFRAME, Posicion);
            //******************************
            return aux;}
"frameborder"	{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(IFRAME_FRAMEBORDER, Posicion);
            //******************************
            return aux;}
"target"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(IFRAME_TARGET_LINK, Posicion);
            //******************************
            return aux;}

"width"         {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(WIDTH, Posicion);
            //******************************
            return aux;}
"heigth"        {lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(HEIGHT, Posicion);
            //******************************
            return aux;}
"href"  	{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(REFERENCE, Posicion);
            //******************************
            return aux;}

"b"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(BOLD_FORMATTING, Posicion);
            //******************************
            return aux;}
"i"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(ITALIC_FORMATTING, Posicion);
            //******************************
            return aux;}


{heading}	{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(HEADING, Posicion);
            //******************************
            return aux;}

"xml"	{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(XML, Posicion);
            //******************************
            return aux;}


"a"		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(LINK, Posicion);
            //******************************
            return aux;}


{TEXT}		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(TEXT, Posicion);
            //******************************
            return aux;}


{digit}+	{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(NUMBER, Posicion);
            //******************************
            return aux;}
{space}	{}
.		{lexeme=yytext();
            //*****************************
            int[] Posicion = new int[2];
            Posicion[0] = yycolumn;
            Posicion[1] = yyline;
            Nodo aux = new Nodo(ERROR, Posicion);
            //******************************
            return aux;}

/*
TOKENS

NOT, YY ,OO, IGUALIGUAL, DIFERENTE,MAYORIGUAL,MENORIGUAL,MENOSNUM, MENOSUNO, MASNUM, MASUNO, MAS, PORNUM, ENTRENUM, MENOS, POR, RESIDUO, EQUALS, SEMICOLON, COMA, LPAR, RPAR, LCBRACE, RCBRACE,
DOCUMENT_EXTERNALSOURCE_LINK, STYLE,DEFAULT_ADDRESS,META_DATA,SCRIPT,DOCTYPE,BODY,BREAK,HORIZONTAL_RULE,IMAGE,SOURCE,ALTERNATIVE_NAME, PARRAGRAPH,TABLE,TABLE_ROW,TABLE_ITEM,UNORDERED_LIST,ORDERED_LIST,DEFINITION_LIST,
DEFINITION_LIST_ITEM, DEFINITION_LIST_DESCRIPTION,BLOCK_LEVEL_SECTION,BLOCK_LEVEL_INLINE,FORM,INPUT,TYPE,NAME,VALUE,INPUT_ACTION,INPUT_METHOD,IFRAME,IFRAME_FRAMEBORDER,IFRAME_TARGET_LINK,WIDTH,HEIGHT,REFERENCE,LINK, BOLD_FORMATTING,
ITALIC_FORMATTING,TEXT,HEADING,ID, NUMBER, LIST_ITEM, CLOSE_DECLARATION, HTML, START_TAG, CLOSE_TAG, END_TAG , HEAD

*/