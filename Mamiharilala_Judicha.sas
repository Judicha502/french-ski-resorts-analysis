/* Projet STA118 - Stations de ski */
/* Auteur : Judicha Mamiharilala */

/* Question 13 : Importation du fichier ski2.txt */

proc import datafile="/home/u64483755/ski2.txt"
    out=ski
    dbms=dlm
    replace;
    delimiter=";";
    getnames=yes;
    guessingrows=max;
run;

proc contents data=ski;
run;

proc print data=ski(obs=10);
run;

/* Question 14 : Moyenne, minimum et maximum des altitudes par massif */

proc means data=ski mean min max maxdec=2;
    class Massif;
    var Altstation Altsommetdespistes;
run;

/* Question 15 : Extraction du code département */

data ski;
    set ski;
    CodeDept = scan(Departement, 2, '()');
run;

proc print data=ski(obs=10);
    var KIDEN Departement CodeDept;
run;

/* Question 16 : Suppression de la chaîne "q-p" */

data ski;
    set ski;
    Rapport_sans_qp = tranwrd('Rapportqualite.prixforfait'n, "q-p", "");
run;

proc print data=ski(obs=10);
    var KIDEN 'Rapportqualite.prixforfait'n Rapport_sans_qp;
run;

/* Question 17 : Analyse en Composantes Principales */

proc princomp data=ski
    out=coord_acp
    plots=none;
    var Altstation Altsommetdespistes Kmpistesalpin
        Nbvertes Nbbleues Nbrouges Nbnoires
        tlpheriques tlcabines tlsieges tlskis
        Pxalpin Kmpistesfond PXfond Nblits
        bassesaison hautesaison
        Prixappartementbassesaison Prixappartementhautesaison;
run;

/* Question 17 : Analyse en Composantes Principales */

proc princomp data=ski
    out=coord_acp
    plots=none;
    var Altstation Altsommetdespistes Kmpistesalpin
        Nbvertes Nbbleues Nbrouges Nbnoires
        tlpheriques tlcabines tlsieges tlskis
        Pxalpin Kmpistesfond PXfond Nblits
        bassesaison hautesaison
        Prixappartementbassesaison Prixappartementhautesaison;
run;

/* Vérification de la table des coordonnées ACP */

proc print data=coord_acp(obs=10);
    var KIDEN Prin1 Prin2;
run;

/* Question 17b : Représentation des stations sur les deux premières composantes */

proc sgplot data=coord_acp;
    scatter x=Prin1 y=Prin2 / datalabel=KIDEN;
    xaxis label="Composante principale 1";
    yaxis label="Composante principale 2";
    title "Projection des stations sur les deux premières composantes";
run;







