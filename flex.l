

%{

int nbr_de_lignes = 0 ;

%}

lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+


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
. {printf("erreur lexicale a la ligne %d \n", nbr_de_lignes);} 




%%

int main(){
    yylex();
    return 0;
}


