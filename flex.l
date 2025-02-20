

%{

#include<stdio.h>
int num_de_lignes = 1 ;

%}

lettre [a-zA-Z]
chiffre [0-9]
car [^ ,'\n\t]
IDF {lettre}{car}*
cst {chiffre}+
chaine \'[^\']*\'
commentaire1 \#\#[^\n]
commentaire2 \{--([.|\n]*)--\}


%%
{commentaire2} {printf("commentaire sur plusiurs lignes\n");}
MainProgram {printf("mot cle %s \n", yytext);}
Declaration {printf ("mot cle %s \n",yytext);}
Body {printf ("mot cle %s \n",yytext);}
begin {printf ("mot cle %s \n",yytext);}
end {printf ("mot cle %s \n",yytext);}
readln {printf ("mot cle %s \n",yytext);}
writeln {printf ("mot cle %s \n",yytext);}
Entier {printf ("mot cle type %s \n",yytext);}
Reel {printf ("mot cle type %s \n",yytext);}
{IDF} { if (yyleng > 12) 
    {printf ("erreur lexicale : le IDF depasse 12 caracteres \n");}
    else {
    printf ("IDF %s \n",yytext);}
} 
{chiffre} {printf ("chiffre \n");}
{commentaire1} {printf("commentaire sur une ligne: %s \n",yytext);}
\n {num_de_lignes++ ;}
"{" {printf("accolade_ouvrante\n");}
"}" {printf("accolade_fermante \n");}
:= {printf("affectation := \n");}
; {printf("pnt_virgul ; \n");}
"*" {printf("multiplication * \n");}
"-" {printf("soustract -\n");}
"+" {printf("addition + \n");}
, {printf("virgule \n");}
: {printf ("declaration : \n");}
"(" {printf ("parenthese_ouvrante  \n");}
")" {printf ("parenthese_fermante \n");}
\' {printf ("Guillemets \n");}
{chaine} {printf("chainde de car: %s \n",yytext);}
[ \t] {printf("");}
. {printf("erreur lexicale a la ligne %d \n", num_de_lignes);} 

%%

int main(){
    yylex();
    return 0;
}



