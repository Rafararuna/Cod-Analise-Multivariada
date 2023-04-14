** Importando o banco da Questão 1;
proc import datafile = "/home/u60981556/Prova 1 - AM/Prova 1 - Questão 1.xlsx" DBMS=xlsx out=dados_prova;
GETNAMES=YES ; 
run;

** Questão 1 ;

proc standard data=dados_prova mean=0 std=1 replace
              print out=dados_prova_z;
run;
proc capability data=dados_prova_z noprint;
     qqplot X1 X2 X3 X4 X5 X6 X7 /
        normal(mu=est sigma=est cpkscale cpkref) square;
run;
ods graphics on;
proc factor data=dados_prova_z simple corr
   nfactors=2 residuals
   plots=(scree initloadings preloadings loadings)
   rotate=varimax;
run;
ods graphics off;


** Importando o banco da Questão 2;
proc import datafile = "/home/u60981556/Prova 1 - AM/Prova 1 - Questão 2.xlsx" DBMS=xlsx out=dados_prova2;
GETNAMES=YES ; 
run;

** Questão 2 ;

proc standard data=dados_prova2 mean=0 std=1 replace print
       out=dados_prova2_z;
run;
ods graphics on;

proc princomp data=dados_prova2 cov n=7 outstat=Parcial_Corr
       plots(ncomp=2)=all plots=score(ellipse);
run;
ods graphics off;

** Letra c) da Questão 2 ;
proc standard data=dados_prova2 mean=0 std=1 replace
              print out=dados_prova2_z;
run;

proc princomp data=dados_prova2_z cov n=7 outstat=Parcial_Corr
       plots(ncomp=2)=all plots=score(ellipse);
run;
ods graphics off;