** Questão 1

/* Generated Code (IMPORT) */
/* Source File: banco 1 - prova 2.xlsx */
/* Source Path: /home/u60981556/Resolução - Prova 2 */
/* Code generated on: 19/04/22 08:06 */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u60981556/Resolução - Prova 2/banco 1 - prova 2.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);

** Letra a;

proc univariate data=WORK.IMPORT normal plot;
var x1 x2 x3 x4 x5;
run;

** Letra b;

proc sort; by Zona; run;
proc means data=WORK.IMPORT mean;
by Zona;
var X1 X2 X3 X4 X5;
run;

** Letras c e d;

proc discrim data=WORK.IMPORT method=normal
manova wcov pcov
pool=no out=results ;
class Zona;
var X1 X2 X3 X4 X5;
run;


proc iml;
x_1 = { 3.2285714 43.5714286 0.1171429 6.795714 11.5400000 };
x_2 = { 4.4454545 33.0909091 0.1709091 6.5609091 5.4836364 };
x_3 = { 7.2263158 22.2526316 0.4321053 4.6581579 5.7678947};
Sc = {3.53915552	-0.65683720	-0.12920733	-0.39875010	1.50325070,
	 -0.65683720	79.64449271	0.37947753	1.57965883	-5.42474388,
	 -0.12920733	0.37947753	0.08369180	0.16297458	-0.00738807,
	 -0.39875010	1.57965883	0.16297458	1.07623459	0.62669842,
	 1.50325070	-5.42474388	-0.00738807	0.62669842	6.37779030};
ScInv = inv(Sc);
x0 = { 5.5 38.3 0.3 5.8 7.5 };
D2_1 = (x0 - x_1)*ScInv*transp(x0 - x_1);
D2_2 = (x0 - x_2)*ScInv*transp(x0 - x_2);
D2_3 = (x0 - x_3)*ScInv*transp(x0 - x_3);
print ScInv; print D2_1 D2_2 D2_3;
quit;

proc gplot data = results;
plot can2*can1 = tipo;
title2 '1a. e 2a. Variáveis Canônicas';
run;
quit;


** Questão 2;

/* Generated Code (IMPORT) */
/* Source File: banco 2 - prova 2.xlsx */
/* Source Path: /home/u60981556/Resolução - Prova 2 */
/* Code generated on: 19/04/22 08:20 */

%web_drop_table(WORK.IMPORT1);


FILENAME REFFILE '/home/u60981556/Resolução - Prova 2/banco 2 - prova 2.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT1;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT1; RUN;


%web_open_table(WORK.IMPORT1);

** Letra a;

proc distance data=WORK.IMPORT1 out=Dist method=Euclid;
var interval(x1 x2 x3 x4 x5 x6 / std=Std); id Nome;
run;

title2 'Conjunto de dados de saída de PROC DISTANCE';
proc print data=Dist;
run;
ods graphics on;

** Letra b;

title2 'Método Ward';
proc cluster data=WORK.IMPORT1 outtree=tree
method=ward ccc pseudo;
	var X1 X2 X3 X4 X5 X6;
	id Nome;
run;

proc tree data=tree out=newdata nclusters=2;
	id Nome;
	copy X1 X2 X3 X4 X5 X6;
run;

proc sort data=newdata;
	by cluster;
run;

proc means data=newdata noprint;
	by cluster;
	output out=myseeds mean=X1 X2 X3 X4 X5 X6;
	var X1 X2 X3 X4 X5 X6;
run;

** Letra c;

Title 'Sementes_Centróides para o Clustering';
proc fastclus data=WORK.IMPORT1 maxiter=20 maxclusters=2 distance radius=.001 replace=full
seed=myseeds out=clus_out;
var x1 x2 x3 x4 x5 x6 ; id Nome; run;

proc sort data = clus_out; by cluster distance; run;



** Questão 3;

/* Generated Code (IMPORT) */
/* Source File: banco 3 - prova 2.xlsx */
/* Source Path: /home/u60981556/Resolução - Prova 2 */
/* Code generated on: 19/04/22 08:46 */

%web_drop_table(WORK.IMPORT2);


FILENAME REFFILE '/home/u60981556/Resolução - Prova 2/banco 3 - prova 2.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT2;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT2; RUN;


%web_open_table(WORK.IMPORT2);

** Letras a, b, c;

proc corresp data=WORK.IMPORT2 out=plot short profile=row;
  var X1 X2 X3 X4 X5 X6;
  id Marca;
 run;




