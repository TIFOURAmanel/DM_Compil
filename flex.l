

%{

#include<stdio.h>
int nbr_de_lignes = 1 ;

%}

lettre [a-zA-Z]
chiffre [0-9]
car [^ ,\n\t]
IDF {lettre}{car}*
cst {chiffre}+
chaine \'[^\']*\'


%%
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
    printf ("IDF \n");}
} 
\n {nbr_de_lignes++ ;}
"{" {printf("accolade_ouvr\n");}
"}" {printf("accolade_ferm\n");}
:= {printf("affect \n");}
; {printf("pnt_virgul \n");}
"*" {printf("multiplication \n");}
"-" {printf("soustract \n");}
"+" {printf("addition \n");}
, {printf("virgule \n");}
: {printf ("declaration \n");}
"(" {printf ("parenthese_ouvr \n");}
")" {printf ("parenthese_ferm \n");}
\' {printf ("Guillemets \n");}
{chaine} {printf("chainde de car \n");}
[ \t] {printf("");}
. {printf("erreur lexicale a la ligne %d \n", nbr_de_lignes);} 




%%

int main(){
    yylex();
    return 0;
}

point virgul , comments 

