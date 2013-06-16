package AnalizadorLexicoSintactico;
import java_cup.runtime.Symbol;


/*
Directivas:
public: clase publica
cup: compatibilidad con cup
full: extender el alfabeto con todos los valores de 8 bits
line: agrega la variable int yyline, para indicar la fila del lexema
char: agrega la variable int yychar, indica el indice del primer caracter del lexema
ignorecase: validar, indistitntamente si la letra es mayuscula o minuscula
eofval: especifica un valor de retorno al final del archivo
*/

%%


%cup
%full
%line
%column
%char

%eofval{
	return new Symbol(sym.EOF,new String("Fin del archivo"));
%eofval}

digit = [0-9]
letter = [a-zA-Z]|":"|"."|"%"|"!"|"@"|"#"
TEXT = {letter}({letter}|{digit}|"_")*
space = \t|\f|" "|\r|\n
LineEnd = \r|\n|\r\n
InputChar = [^\r\n]
Comment = "<!--"([^-]|-[^-]|--+[^->])*-*-->
StringURL = "\"" "http://" [^\*\n"\""]*"\""
StringDir = "\"" "\/"[^\*\n"\""]*"\""
StringNumber = "\""{digit}({digit})*"\""
String = "\""[^\*\n"\""]*"\""



%%
"<!--"([^"--"]|"--"[^>]) {return new Symbol(sym.ERROR_UNTERM_COMMENT, yychar, yyline, yytext());}
{StringNumber}  {return new Symbol(sym.STRINGNUM, yychar, yyline, yytext());}
{StringDir}  {return new Symbol(sym.STRINGDIR, yychar, yyline, yytext());}
{StringURL}  {return new Symbol(sym.STRINGURL, yychar, yyline, yytext());}
{String}        {return new Symbol(sym.STRING, yychar, yyline, yytext());}
"\""[^\*\n"\""]*"\n" {return new Symbol(sym.ERROR_UNTERM_STRING, yychar, yyline, yytext());}
"="             {return new Symbol(sym.EQUALS, yychar, yyline, yytext());}
";"             {return new Symbol(sym.SEMICOLON, yychar, yyline, yytext());}
","             {return new Symbol(sym.COMA, yychar, yyline, yytext());}
"("             {return new Symbol(sym.LPAR, yychar, yyline, yytext());}
")"             {return new Symbol(sym.RPAR, yychar, yyline, yytext());}
"{"             {return new Symbol(sym.LCBRACE, yychar, yyline, yytext());}
"}"             {return new Symbol(sym.RCBRACE, yychar, yyline, yytext());}
">"             {return new Symbol(sym.END_TAG, yychar, yyline, yytext());}
"<"             {return new Symbol(sym.START_TAG, yychar, yyline, yytext());}
"/"             {return new Symbol(sym.CLOSE_DECLARATION, yychar, yyline, yytext());}
"textarea"      {return new Symbol(sym.TEXTAREA, yychar, yyline, yytext());}
"col"           {return new Symbol(sym.COLUMN, yychar, yyline, yytext());}
"class"           {return new Symbol(sym.CLASS, yychar, yyline, yytext());}
"size"           {return new Symbol(sym.SIZE, yychar, yyline, yytext());}
"tbody" 	{return new Symbol(sym.TABLE_BODY, yychar, yyline, yytext());}
"tfoot"		{return new Symbol(sym.TABLE_FOOT, yychar, yyline, yytext());}
"thead"		{return new Symbol(sym.TABLE_HEAD, yychar, yyline, yytext());}
"scope"     	{return new Symbol(sym.SCOPE, yychar, yyline, yytext());}
"th"            {return new Symbol(sym.TABLE_HEADER, yychar, yyline, yytext());}
"id"            {return new Symbol(sym.ID, yychar, yyline, yytext());}
"caption"	{return new Symbol(sym.CAPTION, yychar, yyline, yytext());}
"summary"	{return new Symbol(sym.SUMMARY, yychar, yyline, yytext());}
"address"	{return new Symbol(sym.ADDRESS, yychar, yyline, yytext());}
"?"             {return new Symbol(sym.META_DECLARATION, yychar, yyline, yytext());}
"version"       {return new Symbol(sym.VERSION, yychar, yyline, yytext());}
"encoding"      {return new Symbol(sym.ENCODING, yychar, yyline, yytext());}
"option"        {return new Symbol(sym.OPTION, yychar, yyline, yytext());}
"selected"      {return new Symbol(sym.SELECTED, yychar, yyline, yytext());}
"select"        {return new Symbol(sym.SELECT, yychar, yyline, yytext());}
"xml:lang"      {return new Symbol(sym.XML_LANGUAGE, yychar, yyline, yytext());}
"xmlns:xsi"     {return new Symbol(sym.XMLNS_XSI, yychar, yyline, yytext());}
"xml:space"     {return new Symbol(sym.XML_SPACE, yychar, yyline, yytext());}
"pre"           {return new Symbol(sym.PRESERVE, yychar, yyline, yytext());}
"xmlns"         {return new Symbol(sym.XMLNS, yychar, yyline, yytext());}
"h1"         {return new Symbol(sym.HEADING1, yychar, yyline, yytext());}
"h2"         {return new Symbol(sym.HEADING2, yychar, yyline, yytext());}
"h3"         {return new Symbol(sym.HEADING3, yychar, yyline, yytext());}
"h4"         {return new Symbol(sym.HEADING4, yychar, yyline, yytext());}
"h5"         {return new Symbol(sym.HEADING5, yychar, yyline, yytext());}
"h6"         {return new Symbol(sym.HEADING6, yychar, yyline, yytext());}
"http-equiv"    {return new Symbol(sym.HTTP_EQUIVALENT, yychar, yyline, yytext());}
"title"         {return new Symbol(sym.TITLE, yychar, yyline, yytext());}
"lang"          {return new Symbol(sym.LANGUAGE, yychar, yyline, yytext());}
"content"       {return new Symbol(sym.CONTENT, yychar, yyline, yytext());}
"html"		{return new Symbol(sym.HTML, yychar, yyline, yytext());}
"head"		{return new Symbol(sym.HEAD, yychar, yyline, yytext());}
"link"          {return new Symbol(sym.DOCUMENT_EXTERNALSOURCE_LINK, yychar, yyline, yytext());}
"style"		{return new Symbol(sym.STYLE, yychar, yyline, yytext());}
"base"          {return new Symbol(sym.DEFAULT_ADDRESS, yychar, yyline, yytext());}
"meta"          {return new Symbol(sym.META_DATA, yychar, yyline, yytext());}
"script"	{return new Symbol(sym.SCRIPT, yychar, yyline, yytext());}
"!DOCTYPE"      {return new Symbol(sym.DOCTYPE, yychar, yyline, yytext());}
"body"          {return new Symbol(sym.BODY, yychar, yyline, yytext());}
"br"            {return new Symbol(sym.BREAK, yychar, yyline, yytext());}
"hr"            {return new Symbol(sym.HORIZONTAL_RULE, yychar, yyline, yytext());}
"img"           {return new Symbol(sym.IMAGE, yychar, yyline, yytext());}
"src"           {return new Symbol(sym.SOURCE, yychar, yyline, yytext());}
"accesskey"      {return new Symbol(sym.ACCESSKEY, yychar, yyline, yytext());}
"alt"           {return new Symbol(sym.ALTERNATIVE_NAME, yychar, yyline, yytext());}
"p"             {return new Symbol(sym.PARRAGRAPH, yychar, yyline, yytext());}
"table"         {return new Symbol(sym.TABLE, yychar, yyline, yytext());}
"tr"            {return new Symbol(sym.TABLE_ROW, yychar, yyline, yytext());}
"td"            {return new Symbol(sym.TABLE_ITEM, yychar, yyline, yytext());}
"em"            {return new Symbol(sym.EMPHASIS, yychar, yyline, yytext());}
"code"            {return new Symbol(sym.CODEF, yychar, yyline, yytext());}
"ul"            {return new Symbol(sym.UNORDERED_LIST, yychar, yyline, yytext());}
"ol"            {return new Symbol(sym.ORDERED_LIST, yychar, yyline, yytext());}
"strong"            {return new Symbol(sym.STRONG, yychar, yyline, yytext());}
"li"            {return new Symbol(sym.LIST_ITEM, yychar, yyline, yytext());}
"dl"            {return new Symbol(sym.DEFINITION_LIST, yychar, yyline, yytext());}
"dt"            {return new Symbol(sym.DEFINITION_LIST_ITEM, yychar, yyline, yytext());}
"dd"            {return new Symbol(sym.DEFINITION_LIST_DESCRIPTION, yychar, yyline, yytext());}
"div"           {return new Symbol(sym.BLOCK_LEVEL_SECTION, yychar, yyline, yytext());}
"span"          {return new Symbol(sym.BLOCK_LEVEL_INLINE, yychar, yyline, yytext());}
"blockquote"          {return new Symbol(sym.BLOCKQUOTE, yychar, yyline, yytext());}
"form"          {return new Symbol(sym.FORM, yychar, yyline, yytext());}
"input"         {return new Symbol(sym.INPUT, yychar, yyline, yytext());}
"type"          {return new Symbol(sym.TYPE, yychar, yyline, yytext());}
"name"          {return new Symbol(sym.NAME, yychar, yyline, yytext());}
"checked"          {return new Symbol(sym.CHECKED, yychar, yyline, yytext());}
"value"         {return new Symbol(sym.VALUE, yychar, yyline, yytext());}
"cite"          {return new Symbol(sym.CITE, yychar, yyline, yytext());}
"action"        {return new Symbol(sym.INPUT_ACTION, yychar, yyline, yytext());}
"method"        {return new Symbol(sym.INPUT_METHOD, yychar, yyline, yytext());}
"iframe"	{return new Symbol(sym.IFRAME, yychar, yyline, yytext());}
"frameborder"	{return new Symbol(sym.IFRAME_FRAMEBORDER, yychar, yyline, yytext());}
"target"	{return new Symbol(sym.IFRAME_TARGET_LINK, yychar, yyline, yytext());}
"width"         {return new Symbol(sym.WIDTH, yychar, yyline, yytext());}
"align"         {return new Symbol(sym.ALIGN, yychar, yyline, yytext());}
"enctype"         {return new Symbol(sym.ENCRIPTION_TYPE, yychar, yyline, yytext());}
"Valign"         {return new Symbol(sym.VALIGN, yychar, yyline, yytext());}
"height"        {return new Symbol(sym.HEIGHT, yychar, yyline, yytext());}
"href"  	{return new Symbol(sym.REFERENCE, yychar, yyline, yytext());}
"abbr"  	{return new Symbol(sym.ABBR, yychar, yyline, yytext());}
"axis"  	{return new Symbol(sym.AXIS, yychar, yyline, yytext());}
"headers"  	{return new Symbol(sym.HEADERS, yychar, yyline, yytext());}
"rowspan"  	{return new Symbol(sym.ROWSPAN, yychar, yyline, yytext());}
"colspan"  	{return new Symbol(sym.COLSPAN, yychar, yyline, yytext());}
"rows"  	{return new Symbol(sym.ROWS, yychar, yyline, yytext());}
"cols"  	{return new Symbol(sym.COLUMNS, yychar, yyline, yytext());}
"b"             {return new Symbol(sym.BOLD_FORMATTING, yychar, yyline, yytext());}
"i"             {return new Symbol(sym.ITALIC_FORMATTING, yychar, yyline, yytext());}
"xml"           {return new Symbol(sym.XML, yychar, yyline, yytext());}
"a"		{return new Symbol(sym.LINK, yychar, yyline, yytext());}
{TEXT}		{return new Symbol(sym.TEXT, yychar, yyline, yytext());}
{digit}+	{return new Symbol(sym.NUMBER, yychar, yyline, yytext());}
{space}         {/* ignore */}
{Comment}       {/* ignore */}
.		{return new Symbol(sym.ERROR, yychar, yyline, yytext());}


