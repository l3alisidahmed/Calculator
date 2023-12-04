%{
#undef yywrap
#define yywrap() 1
#include<stdio.h>
void Errors (char input[30], int nbrRow, int nbrColumn);
int yyerror(char *msg);
int g=0;
int f=0;
char ReadFile[100];
int rowErr=1;
int colErr=1;
int arr[10];
%}


DIGIT               [0-9]
OPR                 [+*/-]
BEFORE              [+-]
OPEN                [(]
CLOSE               [)]
VERGULE             [.]{DIGIT}+
NOMBRE              {DIGIT}+{VERGULE}?
NBR_BETWEEN         {OPEN}{BEFORE}?{NOMBRE}{CLOSE} 
FORMAT              {BEFORE}?{NOMBRE}{OPR}{NOMBRE}
FORMAT_BETWEEN      {OPEN}{FORMAT}{CLOSE}
FORMAT_1            {FORMAT}{OPR}{DIGIT}+
FORMAT1_BETWEEN     {OPEN}{FORMAT_1}{CLOSE}
FORMAT_2            {NBR_BETWEEN}{OPR}{NBR_BETWEEN}
FORMAT_4            {NBR_BETWEEN}{OPR}{DIGIT}+
FORMAT_5            {DIGIT}+{OPR}{NBR_BETWEEN}
FORMAT_3            {FORMAT}{OPR}{FORMAT}
FORMAT_6            {FORMAT_BETWEEN}{OPR}{FORMAT_BETWEEN}
FORMAT_7            {OPEN}{FORMAT_6}{CLOSE}
FORMAT_8            {OPEN}{FORMAT_BETWEEN}{CLOSE}
FORMAT_9            {FORMAT_BETWEEN}{OPR}{DIGIT}+
FORMAT_10           {OPEN}{FORMAT_9}{CLOSE}
FORMAT_11           {OPEN}{OPEN}{CLOSE}{CLOSE}


%%
{FORMAT} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT_1} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT_3} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT_2} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT_4} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT_5} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT_6} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT_7} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT_8} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT_9} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT_10} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT_BETWEEN} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{FORMAT1_BETWEEN} {
    fprintf(yyout, "%s ✅ \n", yytext);
    colErr = yyleng;
}

{OPR}+ {
    printf("Error Syntaxique (Row = %d || Colum = %d)\n", rowErr, colErr);
}

{DIGIT} {}

[ ] {colErr++;}

[\n] {arr[g]=colErr;colErr=1,rowErr++;g++;}

FIN {
    // fprintf(yyout,"nombre of line: %d \n", rowErr);
    // for(f = 0; f < rowErr; f++) {
    //     fprintf(yyout, "nombre of columns in line %d: %d\n", f+1, arr[f]);
    // }
}

. {
    Errors(yytext, rowErr, colErr);
    // printf("Error Syntaxique (Row = %d || Column = %d)\n", rowErr, colErr);
}
%%

void Errors (char input[30], int nbrRow, int nbrColumn) {
    int i, j;
    int count = 0;
    char operator[4] = "+/*-";
    char numbers[10] = "0123456789";

    for(i = 0; i < 4; i++) {
        for(j =0; j<nbrColumn; j++) {
            if(input[j] == '.' && (input[j+1] != numbers[i])) {
                printf("Error Syntaxique\t (Row = %d || Column = %d)\n", nbrRow, nbrColumn);
                break;
            }
            if(input[j] == operator[i] && input[j+1] == operator[i]){
                printf("Error Syntaxique\t (Row = %d || Column = %d)\n", nbrRow, nbrColumn);
                break;
            }
        }
    }

    

    for(i = 0; i< nbrColumn; i++) {
        if(input[i] == '(') count++;
        if(input[i] == ')') count--;
    }
    if(count != 0) {
        printf("Error Syntaxique\t (Row = %d || Column = %d)\n", nbrRow, nbrColumn);
    }
}

yyerror(char *msg) {
    printf("%s", msg);
}

main() {
    
    
    printf("Donner le nom de fechier: ");
    scanf("%s", &ReadFile); // get the name of file txt form user and save the name in the varaiable ReadFile 
    yyin = fopen(ReadFile, "r"); // fopen method in C language open file with his name given in the paramtre and read the content of this file with mode "r"
    
    yyout = fopen("output.txt", "w");
    if (!yyout) {
        perror("Error opening output file");
        return 1;
    }
    
    yylex();
    
    fclose(yyout);
}