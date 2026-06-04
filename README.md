# french-ski-resorts-analysis

## Description

Ce projet a été réalisé dans le cadre de l’unité d’enseignement **STA118 — Outils informatiques de la statistique**.

L’objectif est d’analyser un jeu de données portant sur **167 stations de ski françaises**, décrites par des variables numériques et catégorielles. Le projet combine une première analyse sous **R** et une analyse multivariée sous **SAS**.

## Objectifs du projet

Le projet est divisé en deux parties :

### Partie R

- Importation et manipulation du jeu de données
- Vérification de l’unicité des identifiants
- Suppression et réorganisation de variables
- Détection des valeurs manquantes
- Statistiques descriptives
- Visualisations graphiques
- Matrice de corrélation des variables numériques
- Création d’un sous-échantillon de stations
- Exportation du jeu de données modifié

### Partie SAS

- Importation du fichier exporté depuis R
- Statistiques descriptives par massif
- Création de nouvelles variables par manipulation de chaînes de caractères
- Analyse en Composantes Principales
- Représentation graphique des stations sur les deux premières composantes principales

## Données

Le jeu de données contient des informations sur des stations de ski françaises, notamment :

- altitude de la station ;
- altitude du sommet des pistes ;
- nombre de pistes par niveau de difficulté ;
- équipements de remontées mécaniques ;
- prix des forfaits ;
- prix d’hébergement ;
- massif et département ;
- accessibilité et caractéristiques touristiques.

## Technologies utilisées

- R
- RStudio
- SAS Studio
- Packages R :
  - `corrplot`
  - `ggplot2`

## Résultats principaux

Quelques résultats obtenus :

- Le département ayant le plus de stations est **la Savoie (73)** avec **42 stations**.
- Le département dont les stations sont les moins hautes en moyenne est **les Vosges (88)** avec une altitude moyenne de **716 m**.
- Le massif dont les stations ont l’altitude moyenne la plus faible sous SAS est **les Vosges**, avec **785,75 m**.
- L’ACP montre que la première composante principale explique environ **52,62 %** de l’inertie totale.
- Les deux premières composantes principales expliquent environ **62,75 %** de l’information totale.

## Structure du dépôt

```text
data/       Données utilisées dans le projet
scripts/    Programmes R et SAS
outputs/    Graphiques et journal SAS
report/     Rapport final du projet
