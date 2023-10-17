#!/usr/bin/bash

#Créer un script pour établir le classement des lieux les plus cités. Prendre en argument l'année, le mois et le nombre de lieux à afficher. Accepter * pour l'année et le mois.

ANNEE=$1
MOIS=$2
NOMBRE_DE_LIEUX_AFFICHES=$3

echo "Top $NOMBRE_DE_LIEUX_AFFICHES des lieux les plus cités en $MOIS/$ANNEE"
cat ~/Documents/Cours/PPE/fichiers_tries/ann/$ANNEE/$MOIS/*.ann|grep "Location"|cut -f 3|sort|uniq -c|sort -n -r|head -n $NOMBRE_DE_LIEUX_AFFICHES
